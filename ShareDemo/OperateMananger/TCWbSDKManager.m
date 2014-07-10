//
//  TCWbSDKManager.m
//  ShareDemo
//
//  Created by luotongyi on 14-7-9.
//  Copyright (c) 2014年 luotongyi. All rights reserved.
//

#import "TCWbSDKManager.h"

@implementation TCWbSDKManager


+ (TCWbSDKManager *)shareTCWbManager
{
    static TCWbSDKManager *_TCWbManager;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _TCWbManager = [[self alloc]init];
    });
    return _TCWbManager;
}

- (id)init
{
    self = [super init];
    if (self) {
        
    }
    return self;
}

- (void)registeTCWbApp
{
    wbApi = [[WeiboApi alloc]initWithAppKey:kTCWbAppId andSecret:kTCWbAppKey andRedirectUri:kTCWbSecretURI andAuthModeFlag:0 andCachePolicy:0];
}

- (BOOL)schemeURL:(NSURL *)url
{
    return [wbApi handleOpenURL:url];
}

- (void)TCWbLoginOn:(UIViewController *)vc
{
    [wbApi loginWithDelegate:vc andRootController:vc];
}

- (void)TCWbLoginOff
{
    // 注销授权
    [wbApi cancelAuth];
}

- (void) checkValid
{
    [wbApi checkAuthValid:TCWBAuthCheckServer andDelegete:self];
}

- (void)onGetHometimeline
{
    NSMutableDictionary *params = [[NSMutableDictionary alloc]initWithObjectsAndKeys:@"json",@"format",
                                   @"0", @"pageflag",
                                   @"30", @"reqnum",
                                   @"0", @"type",
                                   @"0", @"contenttype",
                                   nil];
    [wbApi requestWithParams:params apiName:@"statuses/home_timeline" httpMethod:@"GET" delegate:self];
    
}

- (void) AddPic
{
    UIImage *pic = [UIImage imageNamed:@"icon.png"];
    NSMutableDictionary *params = [[NSMutableDictionary alloc]initWithObjectsAndKeys:@"json",@"format",
                                   @"hi,weibo sdk", @"content",
                                   pic, @"pic",
                                   nil];
    [wbApi requestWithParams:params apiName:@"t/add_pic" httpMethod:@"POST" delegate:self];
}

#pragma mark WeiboRequestDelegate

/**
 * @brief   接口调用成功后的回调
 * @param   INPUT   data    接口返回的数据
 * @param   INPUT   request 发起请求时的请求对象，可以用来管理异步请求
 * @return  无返回
 */
- (void)didReceiveRawData:(NSData *)data reqNo:(int)reqno
{
    NSString *strResult = [[NSString alloc] initWithBytes:[data bytes] length:[data length] encoding:NSUTF8StringEncoding];
    
    NSLog(@"result = %@",strResult);
    
    //注意回到主线程，有些回调并不在主线程中，所以这里必须回到主线程
    dispatch_async(dispatch_get_main_queue(), ^{
        
        [Utility showMsgAlert:strResult];
    });
    
}
/**
 * @brief   接口调用失败后的回调
 * @param   INPUT   error   接口返回的错误信息
 * @param   INPUT   request 发起请求时的请求对象，可以用来管理异步请求
 * @return  无返回
 */
- (void)didFailWithError:(NSError *)error reqNo:(int)reqno
{
    NSString *str = [[NSString alloc] initWithFormat:@"refresh token error, errcode = %@",error.userInfo];
    
    //注意回到主线程，有些回调并不在主线程中，所以这里必须回到主线程
    dispatch_async(dispatch_get_main_queue(), ^{
        
        [Utility showMsgAlert:str];
    });
    
}



#pragma mark WeiboAuthDelegate

/**
 * @brief   重刷授权成功后的回调
 * @param   INPUT   wbapi 成功后返回的WeiboApi对象，accesstoken,openid,refreshtoken,expires 等授权信息都在此处返回
 * @return  无返回
 */
- (void)DidAuthRefreshed:(WeiboApiObject *)wbobj
{
    
    
    //UISwitch
    NSString *str = [[NSString alloc]initWithFormat:@"accesstoken = %@\r openid = %@\r appkey=%@ \r appsecret=%@\r",wbobj.accessToken, wbobj.openid, wbobj.appKey, wbobj.appSecret];
    
    NSLog(@"result = %@",str);
    
    //注意回到主线程，有些回调并不在主线程中，所以这里必须回到主线程
    dispatch_async(dispatch_get_main_queue(), ^{
        
        [Utility showMsgAlert:str];
    });
    
}

/**
 * @brief   重刷授权失败后的回调
 * @param   INPUT   error   标准出错信息
 * @return  无返回
 */
- (void)DidAuthRefreshFail:(NSError *)error
{
    NSString *str = [[NSString alloc] initWithFormat:@"refresh token error, errcode = %@",error.userInfo];
    
    //注意回到主线程，有些回调并不在主线程中，所以这里必须回到主线程
    dispatch_async(dispatch_get_main_queue(), ^{
        
        [Utility showMsgAlert:str];
    });
}

/**
 * @brief   授权成功后的回调
 * @param   INPUT   wbapi 成功后返回的WeiboApi对象，accesstoken,openid,refreshtoken,expires 等授权信息都在此处返回
 * @return  无返回
 */
- (void)DidAuthFinished:(WeiboApiObject *)wbobj
{
    NSString *str = [[NSString alloc]initWithFormat:@"accesstoken = %@\r\n openid = %@\r\n appkey=%@ \r\n appsecret=%@ \r\n refreshtoken=%@ ", wbobj.accessToken, wbobj.openid, wbobj.appKey, wbobj.appSecret, wbobj.refreshToken];
    
    NSLog(@"result = %@",str);
    
    //注意回到主线程，有些回调并不在主线程中，所以这里必须回到主线程
    dispatch_async(dispatch_get_main_queue(), ^{
        
        [Utility showMsgAlert:str];
    });
    
}

/**
 * @brief   授权成功后的回调
 * @param   INPUT   wbapi   weiboapi 对象，取消授权后，授权信息会被清空
 * @return  无返回
 */
- (void)DidAuthCanceled:(WeiboApi *)wbapi_
{
    
}

/**
 * @brief   授权成功后的回调
 * @param   INPUT   error   标准出错信息
 * @return  无返回
 */
- (void)DidAuthFailWithError:(NSError *)error
{
    NSString *str = [[NSString alloc] initWithFormat:@"get token error, errcode = %@",error.userInfo];
    
    //注意回到主线程，有些回调并不在主线程中，所以这里必须回到主线程
    dispatch_async(dispatch_get_main_queue(), ^{
        
        [Utility showMsgAlert:str];
    });
}

/**
 * @brief   授权成功后的回调
 * @param   INPUT   error   标准出错信息
 * @return  无返回
 */
-(void)didCheckAuthValid:(BOOL)bResult suggest:(NSString *)strSuggestion
{
    NSString *str = [[NSString alloc] initWithFormat:@"ret=%d, suggestion = %@", bResult, strSuggestion];
    //注意回到主线程，有些回调并不在主线程中，所以这里必须回到主线程
    dispatch_async(dispatch_get_main_queue(), ^{
        
        [Utility showMsgAlert:str];
    });
}


@end
