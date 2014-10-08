//
//  LFFilmTableViewCell.h
//  LFBBCiPlayer
//
//  Created by Nuno Salvador on 08/10/14.
//  Copyright (c) 2014 Nuno Salvador. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol LFFilmCellViewModelProtocol;

@interface LFFilmTableViewCell : UITableViewCell

- (void)updateWithFilm:(id<LFFilmCellViewModelProtocol>)film;

@end
