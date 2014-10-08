//
//  LFFilm.h
//  LFBBCiPlayer
//
//  Created by Nuno Salvador on 08/10/14.
//  Copyright (c) 2014 Nuno Salvador. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LFFilmCellViewModelProtocol.h"

@interface LFFilm : NSObject <LFFilmCellViewModelProtocol>

@property (nonatomic, strong, readonly) NSString *title;
@property (nonatomic, strong, readonly) NSString *idFilm;
@property (nonatomic, strong, readonly) NSString *updated;
@property (nonatomic, strong, readonly) NSString *content;
@property (nonatomic, strong, readonly) NSArray *link;
@property (nonatomic, strong, readonly) NSString *thumbnail;

- (id)initWithTitle:(NSString *)title idFilm:(NSString *)idFilm updateIn:(NSString *)updated
            content:(NSString *)content links:(NSArray *)links mediaThumbnail:(NSString *)thumbnail;

@end
