//
//  TCWbSDKManager.h
//  ShareDemo
//
//  Created by luotongyi on 14-7-9.
//  Copyright (c) 2014年 luotongyi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WeiboApi.h"

#define kTCWbAppKey @"801522462"
#define kTCWbSecret @"4c0e8f21f4155304c1298181a9265be6"
#define kTCWbSecretURI @"http://t.qq.com/luotongyi1139475967"


@interface TCWbSDKManager : NSObject<WeiboAuthDelegate,WeiboRequestDelegate>
{
    WeiboApi *wbApi;
}

+ (TCWbSDKManager *)shareTCWbManager;

- (void)registeTCWbApp;

- (void)TCWbLoginOn:(UIViewController *)vc;

- (void)TCWbLoginOff;

@end
