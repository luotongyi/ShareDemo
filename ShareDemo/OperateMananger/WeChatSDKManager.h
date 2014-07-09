//
//  WeChatSDKManager.h
//  ShareDemo
//
//  Created by luotongyi on 14-7-9.
//  Copyright (c) 2014年 luotongyi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WXApi.h"

#define kWXApiAppKey @"wxd930ea5d5a258f4f"

@interface WeChatSDKManager : NSObject<WXApiDelegate>
{
    enum WXScene _scene;
}

+ (WeChatSDKManager *)shareWeChatManager;

- (void)registeWeChatApp;

-(void) changeScene:(NSInteger)scene;

@end
