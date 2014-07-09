//
//  UMengSDKManager.m
//  ShareDemo
//
//  Created by luotongyi on 14-7-9.
//  Copyright (c) 2014年 luotongyi. All rights reserved.
//

#import "UMengSDKManager.h"

@implementation UMengSDKManager


+ (UMengSDKManager *)shareUMengManager
{
    static UMengSDKManager *_UMengManager;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _UMengManager = [[self alloc]init];
    });
    return _UMengManager;
}

- (id)init
{
    self = [super init];
    if (self) {
        
    }
    return self;
}

- (void)registeUMengApp
{
//    [MobClick setCrashReportEnabled:NO]; // 如果不需要捕捉异常，注释掉此行
    [MobClick setLogEnabled:YES];  // 打开友盟sdk调试，注意Release发布时需要注释掉此行,减少io消耗
    [MobClick setAppVersion:XcodeAppVersion]; //参数为NSString * 类型,自定义app版本信息，如果不设置，默认从CFBundleVersion里取

    [MobClick startWithAppkey:kUMengAppKey reportPolicy:(ReportPolicy) REALTIME channelId:nil];
//   reportPolicy为枚举类型,可以为 REALTIME, BATCH,SENDDAILY,SENDWIFIONLY几种
//   channelId 为NSString * 类型，channelId 为nil或@""时,默认会被被当作@"App Store"渠道
    
      [MobClick checkUpdate];   //自动更新检查, 如果需要自定义更新请使用下面的方法,需要接收一个(NSDictionary *)appInfo的参数
//    [MobClick checkUpdateWithDelegate:self selector:@selector(updateMethod:)];
    
    [MobClick updateOnlineConfig];  //在线参数配置
    
//    1.6.8之前的初始化方法
//    [MobClick setDelegate:self reportPolicy:REALTIME];  //建议使用新方法
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(onlineConfigCallBack:) name:UMOnlineConfigDidFinishedNotification object:nil];
    
}

- (void)onlineConfigCallBack:(NSNotification *)note
{
    
    NSLog(@"online config has fininshed and note = %@", note.userInfo);
}





@end
