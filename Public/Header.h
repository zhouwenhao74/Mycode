//
//  PhotoBrowseWindow.h
//  爱限免
//
//  Created by Alex on 14-5-25.
//  Copyright (c) 2014年 Alex.Chou. All rights reserved.
//

#ifndef UIdeviece_UIaplication_Header_h
#define UIdeviece_UIaplication_Header_h
//获取设备的名字"My iPhone"
#define kDevieceName [[UIDevice currentDevice] name]//设备唯一标识
//#define kDevieceId [[UIDevice currentDevice] uniqueIdentifier]
//获取系统名字如 IOS  uniqueIdentifier已经被弃用了。

#define kSystemName [[UIDevice currentDevice] systemName]
//获取系统版本号，如7.0
#define kSystemVersion [[UIDevice currentDevice] systemVersion]

//获取设备类型
#define kDevieceModel [[UIDevice currentDevice] model]
//获取本地设备模式
#define kDevieceLocalModel  [[UIDevice currentDevice] localizedModel]
//app应用相关信息获取
#define kInfoDictionary [[NSBundle mainBundle] infoDictionary]
//获取app名字
#define kAppName [kInfoDictionary objectForKey:@"CFBundleDisplayName"]
//获取app应用版本
#define kAppVersion [kInfoDictionary objectForKey:@"CFBundleShortVersionString"]
//获取app应用创建版本
#define kAppCreatVersion [kInfoDictionary objectForKey:@"CFBundleVersion"]
#define kScreenWidth [UIScreen mainScreen].bounds.size.width
#define kScreenHeight [UIScreen mainScreen].bounds.size.height
#define kSelfWidth self.frame.size.width 
#define kSelfHeight self.frame.size.height
#endif
//[UIColor blackColor];      // 0.0 white
//[UIColor darkGrayColor];   // 0.333 white
//[UIColor lightGrayColor];  // 0.667 white
//[UIColor whiteColor];      // 1.0 white
//[UIColor grayColor];       // 0.5 white
//[UIColor redColor];        // 1.0, 0.0, 0.0 RGB
//[UIColor greenColor];      // 0.0, 1.0, 0.0 RGB
//[UIColor blueColor];       // 0.0, 0.0, 1.0 RGB
//[UIColor cyanColor];       // 0.0, 1.0, 1.0 RGB
//[UIColor yellowColor];     // 1.0, 1.0, 0.0 RGB
//[UIColor magentaColor];    // 1.0, 0.0, 1.0 RGB
//[UIColor orangeColor];     // 1.0, 0.5, 0.0 RGB
//[UIColor purpleColor];     // 0.5, 0.0, 0.5 RGB
//[UIColor brownColor];      // 0.6, 0.4, 0.2 RGB
//[UIColor clearColor];      // 0.0 white, 0.0 alpha
