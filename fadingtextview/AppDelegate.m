//
//  AppDelegate.m
//  fadingtextview
//
//  Created by Damien Laughton on 30/12/2011.
//  Copyright (c) 2011 Mobilology Limited. All rights reserved.
//

#import "AppDelegate.h"

#import "FadingTextView.h"

@implementation AppDelegate

@synthesize window = _window;
@synthesize viewController = _viewController;

- (void)dealloc
{
    [_window release];
    [_viewController release];
    [super dealloc];
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]] autorelease];
    // Override point for customization after application launch.
  
    
//    +(UIColor*)burgendyColor {
//        return [UIColor colorWithRed:0.64f green:0.01f blue:0.31f alpha:1.0f];
//    }
//    
//    +(UIColor*)creamColor {
//        return  [UIColor colorWithRed:0.97f green:0.96f blue:0.91f alpha:1.0f];
//    }
    
    UIColor* baseColor = [UIColor colorWithRed:0.64f green:0.01f blue:0.31f alpha:1.0f];
    UIColor* textColor = [UIColor colorWithRed:0.97f green:0.96f blue:0.91f alpha:1.0f];
    
    self.viewController = [[FadingTextView alloc] initWithFrame:CGRectMake(0, 0, 320, 460) baseColor:baseColor andTextColor:textColor];
    self.window.rootViewController = self.viewController;
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    /*
     Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
     Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
     */
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    /*
     Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
     If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
     */
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    /*
     Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
     */
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    /*
     Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
     */
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    /*
     Called when the application is about to terminate.
     Save data if appropriate.
     See also applicationDidEnterBackground:.
     */
}

@end
