//
//  LFRootViewController.m
//  LFBBCiPlayer
//
//  Created by Nuno Salvador on 08/10/14.
//  Copyright (c) 2014 Nuno Salvador. All rights reserved.
//

#import "LFRootViewController.h"
#import "LFFilmTableViewCell.h"

static NSString *const LFFilmCellIdentifier = @"LFFilmCellIdentifier";

@interface LFRootViewController () <UITableViewDataSource, UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, strong) NSArray *films;
@end

@implementation LFRootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
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

@end
