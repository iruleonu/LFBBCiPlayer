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
    [super awakeFromNib];
    
    // Add a corner radius to the image view
    self.filmImageView.layer.cornerRadius = self.filmImageView.frame.size.width / 2.0f;
    // Apply the mask to the new layer corners
    self.filmImageView.layer.masksToBounds = YES;
    
    // Keep the aspect ratio of the soon to be added image
    self.filmImageView.contentMode = UIViewContentModeScaleAspectFill;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

#pragma mark - Setup

- (void)updateWithFilm:(id<LFFilmCellViewModelProtocol>)film
{
    self.filmNameLabel.text = film.title;
    [self.filmImageView setImageWithURL:film.photoURL
                       placeholderImage:[UIImage imageNamed:@"placeholder1"]];
}

@end
