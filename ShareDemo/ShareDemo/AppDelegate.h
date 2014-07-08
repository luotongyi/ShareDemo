//
//  AppDelegate.h
//  ShareDemo
//
//  Created by luotongyi on 14-7-4.
//  Copyright (c) 2014年 luotongyi. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "WeiboSDK.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) UINavigationController *homeNav;


//设置主页
- (void)setHomeViewController;

@end
