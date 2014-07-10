//
//  TCWbSDKManager.h
//  ShareDemo
//
//  Created by luotongyi on 14-7-9.
//  Copyright (c) 2014年 luotongyi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WeiboApi.h"
#import "QQURIs.h"


@interface TCWbSDKManager : NSObject<WeiboAuthDelegate,WeiboRequestDelegate>
{
    WeiboApi *wbApi;
}

+ (TCWbSDKManager *)shareTCWbManager;

- (void)registeTCWbApp;

- (void)TCWbLoginOn:(UIViewController *)vc;

- (void)TCWbLoginOff;

- (BOOL)schemeURL:(NSURL *)url;

@end
