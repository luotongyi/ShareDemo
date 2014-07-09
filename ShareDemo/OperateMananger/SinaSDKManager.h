//
//  SinaSDKManager.h
//  ShareDemo
//
//  Created by luotongyi on 14-7-8.
//  Copyright (c) 2014年 luotongyi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WeiboSDK.h"


#define kWbAppKey @"2316968861"
#define kWbAppRedirectURI @"https://api.weibo.com/oauth2/default.html"

@class SinaSDKManager;
@protocol SinaManagerDelegate <NSObject>

@required
-(void)OpSinaSDK:(SinaSDKManager *)sinaManager didReceiveWeiboResponse:(WBBaseResponse *)response;
-(void)OpSinaSDK:(SinaSDKManager *)sinaManager didReceiveWeiboRequest:(WBBaseRequest *)request;

@end

@interface SinaSDKManager : NSObject<WeiboSDKDelegate>
{
    NSString *accessToken;
    NSString *userId;
}

@property (nonatomic,assign) id<SinaManagerDelegate>delegate;

+ (SinaSDKManager *)shareSinaManager;

//注册使用微博
- (void)registeAppKey;

- (BOOL)schemeURL:(NSURL *)url;

- (void)weiboLogin;

//发布微博
- (WBMessageObject *)messageToShare;

- (void)sendShareRequest;

- (void)shareRequest;

- (void)getResponse;

@end
