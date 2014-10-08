//
//  LFFilmsDataSource+Parser.m
//  LFBBCiPlayer
//
//  Created by Nuno Salvador on 08/10/14.
//  Copyright (c) 2014 Nuno Salvador. All rights reserved.
//

#import "LFFilmsDataSource+Parser.h"
#import "LFFilm.h"
#import "GDataXMLNode.h"

@implementation LFFilmsDataSource (Parser)

+ (void)parseFilmsData:(NSData *)data withCompletion:(LFFilmsDataSourceCompletion)completion
{
    NSError *error = nil;
    NSMutableArray *films = [NSMutableArray array];
    GDataXMLDocument *doc = [[GDataXMLDocument alloc] initWithData:data error:&error];
    NSArray *results = [doc.rootElement elementsForName:@"entry"];
    
    for (GDataXMLElement *element in results) {
        NSArray *titlesArray = [element elementsForName:@"title"];
        NSArray *idFilmArray = [element elementsForName:@"id"];
        NSArray *updatedArray = [element elementsForName:@"updated"];
        NSArray *contentArray = [element elementsForName:@"content"];
        NSArray *linksArray = [element elementsForName:@"link"];
        NSString *title = nil;
        NSString *idFilm = nil;
        NSString *updated = nil;
        NSString *content = nil;
        NSString *thumbnail = nil;
        NSArray *links = nil;
        
        if (titlesArray.count > 0) {
            GDataXMLElement *element = (GDataXMLElement *) [titlesArray objectAtIndex:0];
            title = element.stringValue;
        }
        if (idFilmArray.count > 0) {
            GDataXMLElement *element = (GDataXMLElement *) [idFilmArray objectAtIndex:0];
            idFilm = element.stringValue;
        }
        if (updatedArray.count > 0) {
            GDataXMLElement *element = (GDataXMLElement *) [updatedArray objectAtIndex:0];
            updated = element.stringValue;
        }
        if (contentArray.count > 0) {
            GDataXMLElement *element = (GDataXMLElement *) [contentArray objectAtIndex:0];
            content = element.stringValue;
        }
        if (linksArray.count > 2) {
            GDataXMLElement *elementOne = (GDataXMLElement *) [linksArray objectAtIndex:0];
            GDataXMLElement *elementTwo = (GDataXMLElement *) [linksArray objectAtIndex:1];
            GDataXMLElement *elementThree = (GDataXMLElement *) [linksArray objectAtIndex:2];
            GDataXMLNode *linkOne = [elementOne attributeForName:@"href"];
            GDataXMLNode *linkTwo = [elementTwo attributeForName:@"href"];
            GDataXMLNode *linkThree = [elementThree attributeForName:@"href"];
            GDataXMLNode *attributeUrl;
            
            // Get the element mediaContent node
            NSArray *mediaContentArray = [elementOne elementsForName:@"media:content"];
            if (mediaContentArray.count > 0) {
                GDataXMLElement *mediaContentElement = (GDataXMLElement *) [mediaContentArray objectAtIndex:0];
                NSArray *mediaThumbnailArray = [mediaContentElement elementsForName:@"media:thumbnail"];
                
                if (mediaThumbnailArray.count > 0) {
                    GDataXMLElement *mediaThumbnailElement = (GDataXMLElement *) [mediaThumbnailArray objectAtIndex:0];
                    attributeUrl = [mediaThumbnailElement attributeForName:@"url"];
                }
            }
            
            // Set the thumbnail
            thumbnail = attributeUrl.stringValue;
            
            // Set the links
            links = @[linkOne.stringValue, linkTwo.stringValue, linkThree.stringValue];
        }
        
        
        // Add it to the film
        LFFilm *film = [[LFFilm alloc] initWithTitle:title idFilm:idFilm updateIn:updated
                                             content:content links:links mediaThumbnail:thumbnail];
        [films addObject:film];
    }
    
    dispatch_async(dispatch_get_main_queue(), ^(void) {
        completion(films,error);
    });
}

@end
