//
//  BNRAppDelegate.m
//  Hypnosister
//
//  Created by FangYiXiong on 14-4-20.
//  Copyright (c) 2014年 Fang YiXiong. All rights reserved.
//

#import "BNRAppDelegate.h"
#import "BNRHypnosisView.h"

@implementation BNRAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    
    // 创建各种 Rect
    CGRect screenRect = self.window.bounds;
    CGRect bigRect = screenRect;
    bigRect.size.width *= 2.0;
    
    // 创建一个屏幕大小的 ScrollView ，并将其加入 window
    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:screenRect];
    scrollView.pagingEnabled = YES;
    [self.window addSubview:scrollView];
    
    // 创建一个屏幕大小的 HypnosisView，并将其加入 ScrollView
    BNRHypnosisView *firstHypnosisView = [[BNRHypnosisView alloc] initWithFrame:screenRect];
    [scrollView addSubview:firstHypnosisView];
    
    // 再创建一个 HypnosisView，放到原来的右边
    screenRect.origin.x += screenRect.size.width;
    BNRHypnosisView *secondHypnosisView = [[BNRHypnosisView alloc] initWithFrame:screenRect];
    [scrollView addSubview:secondHypnosisView];
    
    // 告诉 ScrollView 它的内容区域有多大
    scrollView.contentSize = bigRect.size;
    
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
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

@end
