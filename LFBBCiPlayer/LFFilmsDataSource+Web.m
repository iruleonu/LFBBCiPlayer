//
//  LFFilmsDataSource+Web.m
//  LFBBCiPlayer
//
//  Created by Nuno Salvador on 08/10/14.
//  Copyright (c) 2014 Nuno Salvador. All rights reserved.
//

#import "LFFilmsDataSource+Web.h"
#import "LFFilmsDataSource+Parser.h"

// Good old films endpoint (http://feeds.bbc.co.uk/iplayer/categories/films/tv/list) was terminated
// Use this news endpoint output backup (found on google) with the same format
static NSString *const LFFilmsEndPoint = @"http://pastebin.com/raw.php?i=KfwehGpM";

@implementation LFFilmsDataSource (Web)

+ (void)filmsFromWebWithCompletionBlock:(LFFilmsDataSourceCompletion)completionBlock
{
    NSURL *productsEndPointURL = [NSURL URLWithString:LFFilmsEndPoint];
    NSURLSession *session = [NSURLSession sharedSession];
    
    [[session dataTaskWithURL:productsEndPointURL completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        if (error) {
            dispatch_async(dispatch_get_main_queue(), ^{
                completionBlock(nil, error);
            });
        }
        else {
            [LFFilmsDataSource parseFilmsData:data withCompletion:completionBlock];
        }
    }] resume];
}

@end
