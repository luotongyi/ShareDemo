//
//  PublicDefines.h
//  ShareDemo
//
//  Created by luotongyi on 14-7-8.
//  Copyright (c) 2014年 luotongyi. All rights reserved.
//

#ifndef ShareDemo_PublicDefines_h
#define ShareDemo_PublicDefines_h

//判断系统是否大于7.0
#define kIOS7 ([[[UIDevice currentDevice] systemVersion] floatValue] >= 7.0 ? YES : NO)

//获取view的宽度和高度
#define kApplicationFrame [[UIScreen mainScreen] applicationFrame]
#define kScreenWidth CGRectGetWidth(kApplicationFrame)
#define kScreenHeight(self) (CGRectGetHeight(kApplicationFrame) - CGRectGetHeight(self.navigationController.navigationBar.frame) - CGRectGetHeight(self.navigationController.tabBarController.tabBar.frame))

#endif
