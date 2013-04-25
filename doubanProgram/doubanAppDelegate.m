//
//  doubanAppDelegate.m
//  doubanProgram
//
//  Created by MrXir on 13-4-23.
//  Copyright (c) 2013年 MrXir. All rights reserved.
//

#import "doubanAppDelegate.h"
#import "doubanProgramViewController.h"
#import "doubanTrendsViewController.h"
#import "doubanSettingViewController.h"
@implementation doubanAppDelegate

- (void)dealloc
{
    [_window release];
    [super dealloc];
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]] autorelease];
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor whiteColor];
    
    /*
     隐藏
    [application setStatusBarHidden:YES withAnimation:UIStatusBarAnimationFade];
     */
    
    [application setStatusBarStyle:UIStatusBarStyleBlackOpaque animated:YES];
    
    //tabBar.viewControllers:
    
    //豆瓣应用
    doubanProgramViewController *MainVC = [[doubanProgramViewController alloc]init];
    MainVC.title = @"豆瓣应用";
    UINavigationController *MainNC = [[UINavigationController alloc]initWithRootViewController:MainVC];
    MainNC.title = @"豆瓣应用";
    
    //动态
    doubanTrendsViewController *TrendsVC = [[doubanTrendsViewController alloc]init];
    TrendsVC.title = @"动态";
    UINavigationController *TrendsNC = [[UINavigationController alloc]initWithRootViewController:TrendsVC];
    TrendsNC.title = @"动态";
    
    //设置
    doubanSettingViewController *SetVC = [[doubanSettingViewController alloc]init];
    SetVC.title = @"设置";
    UINavigationController *SetNC = [[UINavigationController alloc]initWithRootViewController:SetVC];
    SetNC.title = @"设置";
    
    UITabBarController *TabBarVC = [[UITabBarController alloc]init];
    TabBarVC.viewControllers = @[MainNC,TrendsNC,SetNC];
    self.window.rootViewController = TabBarVC;
    
    //内存管理
    [MainVC release],MainVC = nil;
    [MainNC release],MainNC = nil;
    
    [TrendsVC release],TrendsVC = nil;
    [TrendsNC release],TrendsNC = nil;
    
    [SetVC release],SetVC = nil;
    [SetNC release],SetNC = nil;
    
    [TabBarVC release],TabBarVC = nil;
    
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
