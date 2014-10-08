//
//  LFFilmCellViewModelProtocol.h
//  LFBBCiPlayer
//
//  Created by Nuno Salvador on 08/10/14.
//  Copyright (c) 2014 Nuno Salvador. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol LFFilmCellViewModelProtocol <NSObject>

@required
@property (nonatomic, strong, readonly) NSString *title;
@property (nonatomic, strong, readonly) NSURL *photoURL;

@end
