//
//  HomeViewController.m
//  ShareDemo
//
//  Created by luotongyi on 14-7-8.
//  Copyright (c) 2014年 luotongyi. All rights reserved.
//

#import "HomeViewController.h"

@interface HomeViewController ()

@end

@implementation HomeViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)loadView
{
    [super loadView];
    self.title = @"主页";
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	
//    [[SinaSDKManager shareSinaManager] weiboLogin];
//    [[WeChatSDKManager shareWeChatManager] sendTextContent];
//    [[TCWbSDKManager shareTCWbManager] TCWbLoginOn:self];
    [[QQSDKManager shareQQManager] QQLoginOn];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
