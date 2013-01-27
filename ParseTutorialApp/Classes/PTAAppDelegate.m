//
//  AVKAppDelegate.m
//  ParseTutorialApp
//
//  Created by Andrey Kozeletsky on 1/27/13.
//  Copyright (c) 2013 AVKSoftware. All rights reserved.
//

#import "PTAAppDelegate.h"
#import <Parse/Parse.h>

@implementation PTAAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Override point for customization after application launch.
    
    [self configureParse];
    
//    PFObject *player = [PFObject objectWithClassName:@"Player"];//1
//    [player setObject:@"John" forKey:@"Name"];
//    [player setObject:[NSNumber numberWithInt:1230] forKey:@"Score"];//2
//    [player save];//3
    
    return YES;
}
							
- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

#pragma mark - Private methods

- (void)configureParse
{
    // TODO:
    [Parse setApplicationId:@"EtYvC1QtXrOE8r5V9hM9jyZhnTpFEvwtun97hSCu"
                  clientKey:@"LAy4ulF1MtlGyEmqf6At4hGRUFBA0cOwKDy2X4h7"];
}

@end
