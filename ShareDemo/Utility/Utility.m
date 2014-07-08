//
//  Utility.m
//  ShareDemo
//
//  Created by luotongyi on 14-7-8.
//  Copyright (c) 2014年 luotongyi. All rights reserved.
//

#import "Utility.h"

@implementation Utility


+(void)showMsgAlert:(NSString *)msg
{
    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"温馨提示" message:msg delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
    alert.alertViewStyle = UIAlertViewStyleDefault;
    [alert show];
}










@end
