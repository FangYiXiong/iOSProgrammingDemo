//
//  BNRAppDelegate.m
//  HypnoNerd
//
//  Created by Yixiong on 14-4-24.
//  Copyright (c) 2014年 Fang Yixiong. All rights reserved.
//

#import "BNRAppDelegate.h"
#import "BNRHypnosisViewController.h"
#import "BNRReminderViewController.h"

@implementation BNRAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    BNRHypnosisViewController *hvc = [[BNRHypnosisViewController alloc] init];
    
    // 得到指向当前 app bundle 的对象
    NSBundle *appBundle = [NSBundle mainBundle];
    
    // 在 appBundle 中查找 BNRReminderViewController.XIB 这个文件
//    BNRReminderViewController *rvc = [[BNRReminderViewController alloc] initWithNibName:@"BNRReminderViewController" bundle:nil];
    
    // 不使用 withNibName..这个方法也可以，应该该方法为 指定初始化方法，系统会自动调用
    BNRReminderViewController *rvc = [[BNRReminderViewController alloc] init];
    
    UITabBarController *tbc = [[UITabBarController alloc] init];
    tbc.viewControllers = @[hvc,rvc];
    
    
//    self.window.rootViewController = hvc;
//    self.window.rootViewController = rvc;
    self.window.rootViewController = tbc;
    
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
