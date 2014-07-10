//
//  QQSDKManager.h
//  ShareDemo
//
//  Created by luotongyi on 14-7-10.
//  Copyright (c) 2014年 luotongyi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "QQURIs.h"
#import <TencentOpenAPI/TencentOAuth.h>
#import <TencentOpenAPI/QQApi.h>
#import <TencentOpenAPI/sdkdef.h>
#import <TencentOpenAPI/TencentOAuthObject.h>
#import <TencentOpenAPI/TencentMessageObject.h>
#import <TencentOpenAPI/WeiBoAPI.h>

@interface QQSDKManager : NSObject<TencentSessionDelegate>
{
    TencentOAuth* _tencentOAuth;
    NSArray *permissions;
}

+ (QQSDKManager *)shareQQManager;

- (void)registeQQApp;

- (void)QQLoginOn;

- (void)QQLoginOff;

- (void)QQGetUserInfo;

- (BOOL)schemeURL:(NSURL *)url;

@end
