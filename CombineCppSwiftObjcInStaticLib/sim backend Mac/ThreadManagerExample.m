//
//  ThreadManagerExample.m
//  sim backend Mac
//
//  Created by Ol Sen on 23.11.20.
//  Copyright © 2020 Ol Sen. All rights reserved.
//

#import "ThreadManagerExample.h"

static const double kThreadPriority = 1.0;


@interface ReceivingThread : NSThread
@property (nonatomic, weak) ThreadManagerExample * threadManager;
@end


@interface ThreadManagerExample ()
@property (nonatomic, strong) ReceivingThread *thread;
@property (nonatomic, readwrite) BOOL started;
@property (nonatomic, readwrite) uint64_t looptime;
@end

@implementation ThreadManagerExample
-(void)dealloc {
    [NSObject cancelPreviousPerformRequestsWithTarget:self selector:@selector(startThread) object:nil];
    if ( _thread ) {
        [_thread cancel];
        while ( !_thread.isFinished ) {
            [NSThread sleepForTimeInterval:0.01];
        }
    }
}
-(instancetype)init {
    if ( !(self = [super init]) ) return nil;
    
    _looptime = 1000000000; // 1 second

    return self;
}

-(void)startThread {
    if ( !_thread) {
        self.thread = [ReceivingThread new];
        _thread.threadManager = self;
        _thread.name=@"ReceivingThread";
        [_thread setThreadPriority:kThreadPriority];
        [_thread start];
    }
}

-(void)start {
    if ( !_thread ) {
        @synchronized ( self ) {
            self.started = YES;
        }
        [self performSelector:@selector(startThread) withObject:nil afterDelay:0.0];
    }
}

-(void)stop {
    @synchronized ( self ) {
        self.started = NO;
    }
    if ( _thread ) {
        // Stop the thread
        [_thread cancel];
        self.thread = nil;
    }
}
-(void)setLooptime:(uint64_t)looptime {
    if (looptime<10) return;
    @synchronized (self) {
        _looptime = looptime
    }
}
@end

@implementation ReceivingThread {
    BOOL somethinghappend;
    NSString *oldBundleIdentifier;
    NSString *focusedBundleIdentifier;
    NSString *ownBundleIdentifier;
    pid_t oldPID;
    pid_t focusedPID;
    pid_t ownPID;
}
-(instancetype)init {
    if (!(self=[super init])) return nil;
    
    [[[NSWorkspace sharedWorkspace] notificationCenter] addObserver:self selector:@selector(mimi:) name:NSWorkspaceDidActivateApplicationNotification object:nil];
    ownPID = NSRunningApplication.currentApplication.processIdentifier;
    ownBundleIdentifier = NSRunningApplication.currentApplication.bundleIdentifier;
    
    return self;
}
-(void)dealloc {
    [[[NSWorkspace sharedWorkspace] notificationCenter] removeObserver:self name:NSWorkspaceDidActivateApplicationNotification object:nil];
}
-(void)mimi:(NSNotification*)note {
    
    NSRunningApplication *app = note.userInfo[NSWorkspaceApplicationKey];
    focusedBundleIdentifier = app.bundleIdentifier;
    focusedPID = app.processIdentifier;
    
    if (![oldBundleIdentifier isEqualToString:focusedBundleIdentifier] && focusedPID!=ownPID) {
        
        somethinghappend = YES;
        
    } else if (focusedPID != oldPID) {
        
        if (focusedPID==ownPID) {
            NSLog(@"The app watching entire Workspace got focused");
        } else {
            NSLog(@"app was possibly restarted or changed PID");
        }
        
    }
    oldBundleIdentifier = focusedBundleIdentifier;
    oldPID = focusedPID;
}
-(void)main {
    [NSThread setThreadPriority:kThreadPriority];
    
    while ( !self.isCancelled ) {
        uint64_t nextLoop = 0;
        @synchronized ( _threadManager ) {
            
            if (somethinghappend) {

                NSLog(@"%@ %u %u %@",focusedBundleIdentifier, focusedPID, ownPID, ownBundleIdentifier);
                
                // we want to act only once per focus
                somethinghappend = NO;
                
                // inform mainThread of app who has focus now
                [[NSNotificationCenter defaultCenter] postNotificationName:@"focusedBundleIdentifierNotification" object:nil userInfo:@{@"focusedPID":@(focusedPID)}];
                
            }
            
            uint64_t now = mach_absolute_time();
            nextLoop = now + _threadManager.looptime;
        }
        mach_wait_until(nextLoop);
    }
}
@end

