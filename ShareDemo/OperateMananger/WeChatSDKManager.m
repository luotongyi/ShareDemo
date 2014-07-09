//
//  WeChatSDKManager.m
//  ShareDemo
//
//  Created by luotongyi on 14-7-9.
//  Copyright (c) 2014年 luotongyi. All rights reserved.
//

#import "WeChatSDKManager.h"

@implementation WeChatSDKManager


+ (WeChatSDKManager *)shareWeChatManager
{
    static WeChatSDKManager *_weChatManager;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _weChatManager = [[self alloc]init];
    });
    return _weChatManager;
}

- (id)init
{
    self = [super init];
    if (self) {
        
    }
    return self;
}

- (void)registeWeChatApp
{
    [WXApi registerApp:kWXApiAppKey withDescription:@"ShareCollections"];
}





@end
