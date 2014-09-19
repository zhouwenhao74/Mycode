//
//  AppInformationViewController.h
//  爱限免V5
//
//  Created by Alex on 14-5-25.
//  Copyright (c) 2014年 Alex.Chou. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppInformationView.h"
@interface AppInformationViewController : UIViewController<AppInformationViewDelegate>
{
    AppInformationView *_appInformationView;
    NSString *_appIDStr;
    NSString *_iconUrlStr;
    NSString *_appNmaeStr;
    
}
- (id)initWithAppId:(NSString*)appIDStr iconUrlString:(NSString*)iconUrlStr appNameStr:(NSString*)appNmaeStr;
-(void)setAppIdStr:(NSString*)appIDStr;
@end
