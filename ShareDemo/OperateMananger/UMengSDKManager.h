//
//  UMengSDKManager.h
//  ShareDemo
//
//  Created by luotongyi on 14-7-9.
//  Copyright (c) 2014年 luotongyi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MobClick.h"

#define kUMengAppKey @"53bcb91856240bf08a0348c0"

@interface UMengSDKManager : NSObject


+ (UMengSDKManager *)shareUMengManager;

- (void)registeUMengApp;

@end
