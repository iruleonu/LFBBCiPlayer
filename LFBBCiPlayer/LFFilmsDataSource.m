//
//  LFFilmsDataSource.m
//  LFBBCiPlayer
//
//  Created by Nuno Salvador on 08/10/14.
//  Copyright (c) 2014 Nuno Salvador. All rights reserved.
//

#import "LFFilmsDataSource.h"
#import "LFFilmsDataSource+Web.h"

@implementation LFFilmsDataSource

+ (void)filmsWithCompletionBlock:(LFFilmsDataSourceCompletion)completionBlock
{
    [LFFilmsDataSource filmsFromWebWithCompletionBlock:completionBlock];
}

@end
