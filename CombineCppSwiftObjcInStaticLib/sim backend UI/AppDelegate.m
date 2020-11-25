//
//  AppDelegate.m
//  sim backend UI
//
//  Created by Ol Sen on 21.11.20.
//  Copyright © 2020 Ol Sen. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate () {
    id<NSObject> _hideObserver;
}

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    return YES;
}
/*
- (BOOL)application:(UIApplication *)app openURL:(NSURL *)url options:(NSDictionary<UIApplicationOpenURLOptionsKey,id> *)options {
    
    NSString *bundleId = options[UIApplicationOpenURLOptionsSourceApplicationKey];
    if (bundleId) {
        // BundleIdentifier from other app, with same TeamIdentifier
    } else {
        //= nil; from other app, with other TeamIdentifier
    }
    
    NSNumber *isPossible = options[UIApplicationOpenURLOptionUniversalLinksOnly];
    if ([isPossible boolValue]) {
        // url is valid universal link and there is an app that can open it.
    } else {
        // url not valid and or no app to open it.
    }
    
    NSDictionary *annotation = options[UIApplicationOpenURLOptionsAnnotationKey]; //dictionaryRepresentation
    //UIDocumentInteractionController *ann = [[UIDocumentInteractionController alloc] init];
    //[ann setAnnotation:@{}];
    if (annotation) {
        
    }
    
    NSNumber *mustCopyBeforeUse = options[UIApplicationOpenURLOptionsOpenInPlaceKey];
    if ([mustCopyBeforeUse boolValue]) {
        // still needs copy to use it.
    } else {
        // must copy before use
    }
    
    return NO;
}
 */
#pragma mark - UISceneSession lifecycle


- (UISceneConfiguration *)application:(UIApplication *)application configurationForConnectingSceneSession:(UISceneSession *)connectingSceneSession options:(UISceneConnectionOptions *)options {
    // Called when a new scene session is being created.
    // Use this method to select a configuration to create the new scene with.
    return [[UISceneConfiguration alloc] initWithName:@"Default Configuration" sessionRole:connectingSceneSession.role];
}


- (void)application:(UIApplication *)application didDiscardSceneSessions:(NSSet<UISceneSession *> *)sceneSessions {
    // Called when the user discards a scene session.
    // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
    // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
}


@end
