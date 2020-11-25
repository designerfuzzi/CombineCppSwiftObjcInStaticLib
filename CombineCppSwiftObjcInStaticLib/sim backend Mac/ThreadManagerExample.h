//
//  ThreadManagerExample.h
//  sim backend Mac
//
//  Created by Ol Sen on 23.11.20.
//  Copyright © 2020 Ol Sen. All rights reserved.
//

@import AppKit;

NS_ASSUME_NONNULL_BEGIN

@interface ThreadManagerExample : NSObject
@property (nonatomic, readonly) BOOL started;
@property (nonatomic, readonly) uint64_t looptime;
-(void)start;
-(void)stop;
-(void)setLooptime:(uint64_t)looptime;
@end

NS_ASSUME_NONNULL_END
