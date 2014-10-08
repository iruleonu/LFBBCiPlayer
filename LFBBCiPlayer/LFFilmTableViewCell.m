//
//  LFFilmTableViewCell.m
//  LFBBCiPlayer
//
//  Created by Nuno Salvador on 08/10/14.
//  Copyright (c) 2014 Nuno Salvador. All rights reserved.
//

#import "LFFilmTableViewCell.h"
#import "LFFilmCellViewModelProtocol.h"
#import "UIImageView+AFNetworking.h"

@interface LFFilmTableViewCell ()
@property (nonatomic, weak) IBOutlet UIImageView *filmImageView;
@property (nonatomic, weak) IBOutlet UILabel *filmNameLabel;
@end

@implementation LFFilmTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

- (void)updateWithFilm:(id<LFFilmCellViewModelProtocol>)film
{
    self.filmNameLabel.text = film.title;
    [self.filmImageView setImageWithURL:film.photoURL
                       placeholderImage:[UIImage imageNamed:@"placeholder1"]];
}

@end
