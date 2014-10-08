//
//  LFRootViewController.m
//  LFBBCiPlayer
//
//  Created by Nuno Salvador on 08/10/14.
//  Copyright (c) 2014 Nuno Salvador. All rights reserved.
//

#import "LFRootViewController.h"
#import "LFFilmTableViewCell.h"
#import "LFFilmsDataSource.h"
#import "LFFilm.h"

static NSString *const LFFilmCellIdentifier = @"LFFilmCellIdentifier";

@interface LFRootViewController () <UITableViewDataSource, UITableViewDelegate>
@property (nonatomic, weak) IBOutlet UITableView *tableView;
@property (nonatomic, weak) IBOutlet NSLayoutConstraint *tableHeightConstraint;
@property (nonatomic, weak) IBOutlet NSLayoutConstraint *tableWidthConstraint;
@property (nonatomic, strong) NSArray *films;
@end

@implementation LFRootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    __unsafe_unretained typeof(self) weekSelf = self;
    [LFFilmsDataSource filmsWithCompletionBlock:^(NSArray *films, NSError *error) {
        LFRootViewController *strongSelf = weekSelf;
        
        if (strongSelf) {
            // TODO: Handle the NSError
            
            // Sort the films and set them
            strongSelf.films = [films sortedArrayUsingFunction:alphabeticSort
                                                         context:NULL
                                                            hint:[films sortedArrayHint]];
            
            // Set the sizes of the table view to deal with the different resolutions
            self.tableHeightConstraint.constant = strongSelf.tableView.superview.frame.size.height;
            self.tableWidthConstraint.constant = strongSelf.tableView.superview.frame.size.width;
            [strongSelf.tableView needsUpdateConstraints];
            
            // Reload the table view with the new films
            [strongSelf.tableView reloadData];
        }
    }];
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.films count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    LFFilmTableViewCell *filmCell = [tableView dequeueReusableCellWithIdentifier:LFFilmCellIdentifier];
    [filmCell updateWithFilm:self.films[indexPath.row]];
    return filmCell;
}

#pragma mark - UITableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 100.0;
}

#pragma mark - Custom

NSComparisonResult alphabeticSort(id film1, id film2, void *reverse)
{
    NSComparisonResult aux;
    
    if([film1 isKindOfClass:[LFFilm class]] && [film2 isKindOfClass:[LFFilm class]]) {
        LFFilm *castOne = film1;
        LFFilm *castTwo = film2;
        aux = [castOne.title localizedCaseInsensitiveCompare:castTwo.title];
    }
    else {
        aux = NSOrderedSame;
    }
    
    return aux;
}

@end
