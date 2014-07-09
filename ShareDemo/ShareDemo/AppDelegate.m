//
//  AppDelegate.m
//  ShareDemo
//
//  Created by luotongyi on 14-7-4.
//  Copyright (c) 2014年 luotongyi. All rights reserved.
//

#import "AppDelegate.h"

#import "HomeViewController.h"


@implementation AppDelegate

- (void)setHomeViewController
{
    self.window.rootViewController = self.homeNav;
}

//注册分享的app平台
- (void)registeAppKey
{
    //Umeng不需要配置URLScheme
    [[UMengSDKManager shareUMengManager] registeUMengApp];
    
    //需要配置URLScheme
    [[SinaSDKManager shareSinaManager] registeAppKey];
    [[WeChatSDKManager shareWeChatManager] registeWeChatApp];
    [[TCWbSDKManager shareTCWbManager] registeTCWbApp];
}

#pragma mark -创建页面
- (void)creatViews
{
    HomeViewController *hvc = [[HomeViewController alloc]init];
    self.homeNav = [[UINavigationController alloc]initWithRootViewController:hvc];
    self.homeNav.navigationBar.translucent = NO;
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor whiteColor];
    [[UIApplication sharedApplication] setStatusBarOrientation:UIInterfaceOrientationPortrait];
    [[UIApplication sharedApplication] setStatusBarHidden:NO];
    
//    [self registeAppKey];
    
    [self creatViews];
    [self setHomeViewController];
    
    [self.window makeKeyAndVisible];
    return YES;
}

- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation
{
    NSLog(@"-----%@",url);
    NSLog(@"-----%@",[url absoluteString]);
    return [[SinaSDKManager shareSinaManager] schemeURL:url];
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
