//
//  LFFilm.m
//  LFBBCiPlayer
//
//  Created by Nuno Salvador on 08/10/14.
//  Copyright (c) 2014 Nuno Salvador. All rights reserved.
//

#import "LFFilm.h"

@interface LFFilm ()

@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *idFilm;
@property (nonatomic, strong) NSString *updated;
@property (nonatomic, strong) NSString *content;
@property (nonatomic, strong) NSArray *link;
@property (nonatomic, strong) NSString *thumbnail;

@end

@implementation LFFilm

- (id)initWithTitle:(NSString *)title idFilm:(NSString *)idFilm updateIn:(NSString *)updated
            content:(NSString *)content links:(NSArray *)links mediaThumbnail:(NSString *)thumbnail
{
    self = [super init];
    if (self) {
        self.title = title;
        self.idFilm = idFilm;
        self.updated = updated;
        self.content = content;
        self.link = links;
        self.thumbnail = thumbnail;
    }
    return self;
}

#pragma mark - LFFilmCellViewModelProtocol

- (NSURL *)photoURL
{
	NSURLComponents *components;
	
	// Null fail-safe for the nil thumbnail
	if(self.thumbnail) {
		components = [[NSURLComponents alloc] initWithString:self.thumbnail];
	}
	else {
		components = [[NSURLComponents alloc] init];
	}
	
	[components setScheme:@"http"];
	return components.URL;
}

@end
