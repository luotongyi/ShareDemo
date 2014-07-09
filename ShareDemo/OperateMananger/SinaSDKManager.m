//
//  SinaSDKManager.m
//  ShareDemo
//
//  Created by luotongyi on 14-7-8.
//  Copyright (c) 2014年 luotongyi. All rights reserved.
//

#import "SinaSDKManager.h"



@implementation SinaSDKManager


+ (SinaSDKManager *)shareSinaManager
{
    static SinaSDKManager *_sinaSDKManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sinaSDKManager = [[self alloc]init];
    });
    return _sinaSDKManager;
}

- (id)init
{
    self = [super init];
    if (self) {
        
    }
    return self;
}

- (void)registeAppKey
{
    //YES为DEBUG模式，上线的时候需要设置为NO;
    [WeiboSDK enableDebugMode:YES];
    [WeiboSDK registerApp:kWbAppKey];
}

- (void)weiboLogin
{
    WBAuthorizeRequest *request = [WBAuthorizeRequest request];
    request.redirectURI = kWbAppRedirectURL;
    request.scope = @"all";
    [WeiboSDK sendRequest:request];
}

#pragma mark -delegate
- (BOOL)schemeURL:(NSURL *)url
{
    return [WeiboSDK handleOpenURL:url delegate:self];
}

- (void)didReceiveWeiboRequest:(WBBaseRequest *)request
{
    if ([request isKindOfClass:WBProvideMessageForWeiboRequest.class])
    {
        NSLog(@"[request description]:%@",[request description]);
        if (_delegate && [_delegate respondsToSelector:@selector(OpSinaSDK:didReceiveWeiboRequest:)])
        {
            [_delegate OpSinaSDK:self didReceiveWeiboRequest:request];
        }
    }
}

- (void)didReceiveWeiboResponse:(WBBaseResponse *)response
{
    if ([response isKindOfClass:WBAuthorizeResponse.class])
    {
        //授权成功
        NSString *message = [NSString stringWithFormat:@"响应状态: %d\nresponse.userId: %@\nresponse.accessToken: %@\n响应UserInfo数据: %@\n原请求UserInfo数据: %@",response.statusCode, [(WBAuthorizeResponse *)response userID], [(WBAuthorizeResponse *)response accessToken], response.userInfo, response.requestUserInfo];
        NSLog(@"messg  == %@",message);
        
        accessToken = [(WBAuthorizeResponse *)response accessToken];
        userId = [(WBAuthorizeResponse *)response userID];
        
        if (_delegate && [_delegate respondsToSelector:@selector(OpSinaSDK:didReceiveWeiboResponse:)])
        {
            [_delegate OpSinaSDK:self didReceiveWeiboResponse:response];
        }
    }
    else if ([response isKindOfClass:WBSendMessageToWeiboResponse.class])
    {
        NSString *message = [NSString stringWithFormat:@"响应状态: %d\n响应UserInfo数据: %@\n原请求UserInfo数据: %@",(int)response.statusCode, response.userInfo, response.requestUserInfo];
        NSLog(@"messg  == %@",message);
        
        if (_delegate && [_delegate respondsToSelector:@selector(OpSinaSDK:didReceiveWeiboResponse:)])
        {
            [_delegate OpSinaSDK:self didReceiveWeiboResponse:response];
        }
    }
    else
    {
        NSLog(@"messg  == 请求出错啦");
    }
}

- (WBMessageObject *)messageToShare
{
    WBMessageObject *message = [WBMessageObject message];
    
    /*
    {
        message.text = @"测试通过WeiboSDK发送文字到微博!";
    }
    {
        WBImageObject *image = [WBImageObject object];
        image.imageData = [NSData dataWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"image_1" ofType:@"jpg"]];
        message.imageObject = image;
    }
    {
        WBWebpageObject *webpage = [WBWebpageObject object];
        webpage.objectID = @"identifier1";
        webpage.title = @"分享网页标题";
        webpage.description = [NSString stringWithFormat:@"分享网页内容简介-%.0f", [[NSDate date] timeIntervalSince1970]];
        webpage.thumbnailData = [NSData dataWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"image_2" ofType:@"jpg"]];
        webpage.webpageUrl = @"http://sina.cn?a=1";
        message.mediaObject = webpage;
    }
     */
    
    return message;
}

- (void)sendShareRequest
{
    WBSendMessageToWeiboRequest *request = [WBSendMessageToWeiboRequest requestWithMessage:[self messageToShare]];
    request.userInfo = @{@"ShareMessageFrom": @"SendMessageToWeiboViewController",
                         @"Other_Info_1": [NSNumber numberWithInt:123],
                         @"Other_Info_2": @[@"obj1", @"obj2"],
                         @"Other_Info_3": @{@"key1": @"obj1", @"key2": @"obj2"}};
    //    request.shouldOpenWeiboAppInstallPageIfNotInstalled = NO;
    
    [WeiboSDK sendRequest:request];
}

- (void)shareRequest
{
    /*NSString *url = [@"https://open.weibo.cn/2/statuses/upload.json" stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    [WBHttpRequest requestWithAccessToken:@"" url:url httpMethod:@"POST" params:[NSMutableDictionary dictionaryWithObjectsAndKeys:@"",@"",@"",kWbAppRedirectURL,@"status",@"",@"access_token",[UIImage imageNamed:@""],@"pic", nil] delegate:self];
     */
}

- (void)getResponse
{
    WBProvideMessageForWeiboResponse *response = [WBProvideMessageForWeiboResponse responseWithMessage:[self messageToShare]];
    NSLog(@"%@",response);
}

#pragma mark -shareRequest Delegate
- (void)request:(WBHttpRequest *)request didFinishLoadingWithResult:(NSString *)result
{
    
}

- (void)request:(WBHttpRequest *)request didFailWithError:(NSError *)error;
{
    
}

@end
