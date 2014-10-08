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
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *activityIndicatorView;
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

- (void)showAndStartNetworkIndicator
{
    [self.activityIndicatorView startAnimating];
    self.activityIndicatorView.alpha = 1.0f;
}

- (void)hideAndStopNetworkIndicator
{
    [self.activityIndicatorView stopAnimating];
    self.activityIndicatorView.alpha = 0.0f;
}

- (void)updateWithFilm:(id<LFFilmCellViewModelProtocol>)film
{
    self.filmNameLabel.text = film.title;
    
    // Start animating and wait for the completion blocks to switch it off
    [self showAndStartNetworkIndicator];
    
    // Do the request using AFNetworking category on top of the UIImageView
    [self.filmImageView setImageWithURLRequest:[NSURLRequest requestWithURL:film.photoURL]
                              placeholderImage:[UIImage imageNamed:@"placeholder1"]
                                       success:^(NSURLRequest *request, NSHTTPURLResponse *response, UIImage *image) {
                                           self.filmImageView.image = image;
                                           [self hideAndStopNetworkIndicator];
                              } 
                              failure:^(NSURLRequest *request, NSHTTPURLResponse *response, NSError *error) {
                                  //TODO: set a error image
                                  [self hideAndStopNetworkIndicator];
                              }];
}

@end
