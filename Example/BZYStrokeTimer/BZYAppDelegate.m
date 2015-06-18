//
//  BZYAppDelegate.m
//  BZYStrokeTimer
//
//  Created by CocoaPods on 06/17/2015.
//  Copyright (c) 2014 startupthekid. All rights reserved.
//

#import "BZYAppDelegate.h"

@implementation BZYAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[MBFingerTipWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
    
    self.window.rootViewController = [storyboard instantiateInitialViewController];
    
    [self.window makeKeyAndVisible];
    self.window.alwaysShowTouches = YES;
    
    return YES;
}

@end
