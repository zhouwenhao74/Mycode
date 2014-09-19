//
//  AppInformationViewController.m
//  爱限免V5
//
//  Created by Alex on 14-5-25.
//  Copyright (c) 2014年 Alex.Chou. All rights reserved.
//

#import "AppInformationViewController.h"
#import "QFHttpRequest.h"
#import "CONST.h"
#import "Header.h"
#import "AppInformationModel.h"
#import "UIImageView+QFwebImageView.h"
#import "PhotoBrowseWindow.h"
#import "AppDelegate.h"

@interface AppInformationViewController ()
{
    AppInformationModel *_appInformationModel;
    AppRoundModel *_appRoundModel;
}

@end

@implementation AppInformationViewController


- (id)initWithAppId:(NSString*)appIDStr iconUrlString:(NSString*)iconUrlStr appNameStr:(NSString*)appNmaeStr
{
    self = [super init];
    if (self) {
        _appIDStr = [appIDStr copy];
        _appNmaeStr = [appNmaeStr copy];
        _iconUrlStr = [iconUrlStr copy];
        self.navigationItem.title = @"应用详情";
        // Custom initialization
    }
    return self;
}
-(void)dealloc
{
    [self qf_unloadView];
    [_appIDStr release];
    _appIDStr = nil;
    [_appNmaeStr release];
    _appNmaeStr = nil;
    [_iconUrlStr release];
    _iconUrlStr = nil;
    [_appInformationModel release];
    _appInformationModel = nil;
    [super dealloc];
}
- (void)loadView
{
    [super loadView];
    _appInformationView = [[AppInformationView alloc] initWithFrame:self.view.bounds];
    _appInformationView.appInformationViewDelegate = self;
    self.view = _appInformationView;
    //初始化视图的按钮状态
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    id downloads = [defaults objectForKey:@"downloads"];
    id shared = [defaults objectForKey:@"shared"];
    id favorites = [defaults objectForKey:@"favorites"];
    if ([downloads objectForKey:_appIDStr]!=nil) {
        [_appInformationView setDownloadButtonDone];
    }
    if ([shared objectForKey:_appIDStr]!=nil) {
        [_appInformationView setShareButtonDone];
    }
    if ([favorites objectForKey:_appIDStr]!=nil) {
        [_appInformationView setFavoritesButtonDone];
    }
    
    [self showDataWithAppIDStr:_appIDStr];
    
    // Do any additional setup after loading the view.
}
-(void)qf_unloadView
{
    [_appInformationView release];
    _appInformationView = nil;
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma -mark 获得网络数据
-(void)getDataFromNetWithAppIDStr:(NSString *)appIDStr Completion:(void (^)(BOOL finished,NSData *data))completion
{
    [QFHttpRequest requestWithUrlString:APPINFORMATION_URL(appIDStr) finish:^(NSData *data) {
        
        
        if (completion != nil) {
            completion(YES,data);
        }
    } error:^(NSError *error) {
        if (completion != nil) {
            
            completion(YES,nil);
        }
    }];
}
-(void)Completion:(void (^)(BOOL finished,NSData *data))completion
{
    [QFHttpRequest requestWithUrlString:RECOMMENT_URL finish:^(NSData *data) {
        
        
        if (completion != nil) {
            completion(YES,data);
        }
    } error:^(NSError *error) {
        if (completion != nil) {
            
            completion(YES,nil);
        }
    }];
}
-(void)showDataWithAppIDStr:(NSString *)appIDStr
{
    if (appIDStr == nil) {
        return;
    }
    [self getDataFromNetWithAppIDStr:appIDStr Completion:^(BOOL finished, NSData *data) {
        id json = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
        NSDictionary *dic = (NSDictionary*)json;
        [_appInformationModel release];
        _appInformationModel = nil;
        _appInformationModel = [[AppInformationModel alloc] initWithDictionary:dic];
        [_appInformationView setAppInformationModel:_appInformationModel];
        
    }];
    [self Completion:^(BOOL finished, NSData *data) {
        id json =[NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
        NSDictionary *dic = (NSDictionary*)json;
        [_appRoundModel release];
        _appRoundModel = nil;
        _appRoundModel = [[AppRoundModel alloc] initWithDictionary:dic];
        [_appInformationView setAppRoundModel:_appRoundModel];
        
    }];
}

-(void)setAppIdStr:(NSString*)appIDStr
{
    if (appIDStr == nil) {
        [_appIDStr release];
        _appIDStr = nil;
        return;
    }
    [appIDStr retain];
    [_appIDStr release];
    _appIDStr = [appIDStr copy];
    [appIDStr release];
    
}
#pragma -mark AppInformationViewDelegate 方法
-(void)showAIphotoWithFirstPage:(NSUInteger)firstpage
{
  //  NSLog(@"firstpage=%d",firstpage);

    PhotoBrowseWindow *photoBrowseWindow = [PhotoBrowseWindow sharePhotoBrowseWindow];
    [photoBrowseWindow setImageUrlArray:_appInformationModel.originalImageUrlArrayM withIndex:firstpage];
    
    [photoBrowseWindow makeKeyAndVisible];
//    photoBrowseWindow.layer.transform = CATransform3DScale(photoBrowseWindow.layer.transform, 0.0001, 0.0001, 1);
//    [UIView animateWithDuration:0.6 animations:^{
//        photoBrowseWindow.layer.transform = CATransform3DIdentity;
//    } completion:^(BOOL finished) {
//        
//    }];
    [UIView transitionWithView:photoBrowseWindow duration:1 options:UIViewAnimationOptionTransitionFlipFromRight animations:^{
        
    } completion:^(BOOL finished) {
        
    }];
    photoBrowseWindow.layer.transform = CATransform3DIdentity;
}
#pragma -mark 分享 收藏 时候写数据地方，和下载触发事件
-(void)doneButtonClick:(UIButton *)sender
{
    //读写分享数据
    if (sender.tag == 1)
    {
        NSUserDefaults *defaluts = [NSUserDefaults standardUserDefaults];
        id shared = [defaluts objectForKey:@"shared"];
        if (shared == nil) {
            NSMutableDictionary *dic = [[NSMutableDictionary alloc] init];
            NSArray *array = @[_appIDStr,_iconUrlStr,_appNmaeStr];
            [dic setObject:array forKey:_appInformationModel.appIDStr];
            [defaluts setObject:dic forKey:@"shared"];
            //将数据同步给应用程序(执行真正写入plist的操作)
            BOOL ifwrite = [defaluts synchronize];
            if (ifwrite) {
                NSLog(@"写入文件成功");
            }
            else
            {
                NSLog(@"写入文件失败");
            }
            [dic release];
        }else
        {
            NSMutableDictionary *dic = (NSMutableDictionary*)shared;
            dic = [[NSMutableDictionary alloc] initWithDictionary:dic];
            NSArray *array = @[_appIDStr,_iconUrlStr,_appNmaeStr];
            [dic setObject:array forKey:_appIDStr];
            [defaluts setObject:dic forKey:@"shared"];
            //将数据同步给应用程序(执行真正写入plist的操作)
            BOOL ifwrite = [defaluts synchronize];
            if (ifwrite) {
                NSLog(@"写入文件成功");
            }
            else
            {
                NSLog(@"写入文件失败");
            }
            [dic release];
        }
        [_appInformationView setShareButtonDone];
    }
    //读写收藏数据
    if (sender.tag == 2)
    {
        
        NSUserDefaults *defaluts = [NSUserDefaults standardUserDefaults];
        id shared = [defaluts objectForKey:@"favorites"];
        if (shared == nil) {
            NSMutableDictionary *dic = [[NSMutableDictionary alloc] init];
            NSArray *array = @[_appIDStr,_iconUrlStr,_appNmaeStr];
            [dic setObject:array forKey:_appIDStr];
            [defaluts setObject:dic forKey:@"favorites"];
            //将数据同步给应用程序(执行真正写入plist的操作)
            BOOL ifwrite = [defaluts synchronize];
            if (ifwrite) {
                NSLog(@"写入文件成功");
            }
            else
            {
                NSLog(@"写入文件失败");
            }
            [dic release];
        }else
        {
            NSMutableDictionary *dic = (NSMutableDictionary*)shared;
            dic = [[NSMutableDictionary alloc] initWithDictionary:dic];
            NSArray *array = @[_appIDStr,_iconUrlStr,_appNmaeStr];
            [dic setObject:array forKey:_appIDStr];
            [defaluts setObject:dic forKey:@"favorites"];
            
            //将数据同步给应用程序(执行真正写入plist的操作)
            BOOL ifwrite = [defaluts synchronize];
            if (ifwrite) {
                NSLog(@"写入文件成功");
            }
            else
            {
                NSLog(@"写入文件失败");
            }
            
            [dic release];
        }
        [_appInformationView setFavoritesButtonDone];
    }
    //读写已下载数据
    if (sender.tag == 3)
    {
        
        NSUserDefaults *defaluts = [NSUserDefaults standardUserDefaults];
        id shared = [defaluts objectForKey:@"downloads"];
        if (shared == nil) {
            NSMutableDictionary *dic = [[NSMutableDictionary alloc] init];
            NSArray *array = @[_appIDStr,_iconUrlStr,_appNmaeStr];
            
            [dic setObject:array forKey:_appIDStr];
            [defaluts setObject:dic forKey:@"downloads"];
            //将数据同步给应用程序(执行真正写入plist的操作)
            BOOL ifwrite = [defaluts synchronize];
            if (ifwrite) {
                NSLog(@"写入文件成功");
            }
            else
            {
                NSLog(@"写入文件失败");
            }
            
            [dic release];
        }else
        {
            NSMutableDictionary *dic = (NSMutableDictionary*)shared;
            dic = [[NSMutableDictionary alloc] initWithDictionary:dic];
            NSArray *array = @[_appIDStr,_iconUrlStr,_appNmaeStr];
            [dic setObject:array forKey:_appIDStr];
            [defaluts setObject:dic forKey:@"downloads"];
            //将数据同步给应用程序(执行真正写入plist的操作)
            BOOL ifwrite = [defaluts synchronize];
            if (ifwrite) {
                NSLog(@"写入文件成功");
            }
            else
            {
                NSLog(@"写入文件失败");
            }
            [dic release];
        }
        [_appInformationView setDownloadButtonDone];
    }
    
}



@end
