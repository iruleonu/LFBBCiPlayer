//
//  LFFilmsDataSource+Web.h
//  LFBBCiPlayer
//
//  Created by Nuno Salvador on 08/10/14.
//  Copyright (c) 2014 Nuno Salvador. All rights reserved.
//

#import "LFFilmsDataSource.h"

@interface LFFilmsDataSource (Web)

+ (void)filmsFromWebWithCompletionBlock:(LFFilmsDataSourceCompletion)completionBlock;

@end
