//
//  LFFilmsDataSource.h
//  LFBBCiPlayer
//
//  Created by Nuno Salvador on 08/10/14.
//  Copyright (c) 2014 Nuno Salvador. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^LFFilmsDataSourceCompletion)(NSArray *products, NSError *error);

@interface LFFilmsDataSource : NSObject

+ (void)filmsWithCompletionBlock:(LFFilmsDataSourceCompletion)completionBlock;

@end
