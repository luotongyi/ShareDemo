//
//  QQSDKManager.m
//  ShareDemo
//
//  Created by luotongyi on 14-7-10.
//  Copyright (c) 2014年 luotongyi. All rights reserved.
//

#import "QQSDKManager.h"

@implementation QQSDKManager


+ (QQSDKManager *)shareQQManager
{
    static QQSDKManager *_QQManager;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _QQManager = [[self alloc]init];
    });
    return _QQManager;
}

- (id)init
{
    self = [super init];
    if (self) {
        permissions = [[NSArray alloc] initWithObjects:
                         kOPEN_PERMISSION_GET_USER_INFO,
                         kOPEN_PERMISSION_GET_SIMPLE_USER_INFO,
                         kOPEN_PERMISSION_ADD_ALBUM,
                         kOPEN_PERMISSION_ADD_IDOL,
                         kOPEN_PERMISSION_ADD_ONE_BLOG,
                         kOPEN_PERMISSION_ADD_PIC_T,
                         kOPEN_PERMISSION_ADD_SHARE,
                         kOPEN_PERMISSION_ADD_TOPIC,
                         kOPEN_PERMISSION_CHECK_PAGE_FANS,
                         kOPEN_PERMISSION_DEL_IDOL,
                         kOPEN_PERMISSION_DEL_T,
                         kOPEN_PERMISSION_GET_FANSLIST,
                         kOPEN_PERMISSION_GET_IDOLLIST,
                         kOPEN_PERMISSION_GET_INFO,
                         kOPEN_PERMISSION_GET_OTHER_INFO,
                         kOPEN_PERMISSION_GET_REPOST_LIST,
                         kOPEN_PERMISSION_LIST_ALBUM,
                         kOPEN_PERMISSION_UPLOAD_PIC,
                         kOPEN_PERMISSION_GET_VIP_INFO,
                         kOPEN_PERMISSION_GET_VIP_RICH_INFO,
                         kOPEN_PERMISSION_GET_INTIMATE_FRIENDS_WEIBO,
                         kOPEN_PERMISSION_MATCH_NICK_TIPS_WEIBO,
                         nil];
    }
    return self;
}

- (void)registeQQApp
{
    _tencentOAuth = [[TencentOAuth alloc]initWithAppId:kTCWbAppId andDelegate:self];
}

- (BOOL)schemeURL:(NSURL *)url
{
    return [TencentOAuth HandleOpenURL:url];
}

- (void)QQLoginOn
{
    [_tencentOAuth authorize:permissions inSafari:NO];
}

- (void)QQLoginOff
{
    [_tencentOAuth logout:self];
}

- (void)QQGetUserInfo
{
    [_tencentOAuth getUserInfo];
}

#pragma mark -loginDelegate
- (void)tencentDidLogin
{
    
}

- (void)tencentDidNotLogin:(BOOL)cancelled
{
    
}

- (void)tencentDidNotNetWork
{
    
}

- (void)tencentDidLogout
{
    
}

- (void)getUserInfoResponse:(APIResponse *)response
{
    
}

- (void)addShareResponse:(APIResponse *)response
{
    
}





@end
