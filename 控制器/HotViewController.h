//
//  HotViewController.h
//  爱限免V5
//
//  Created by Alex on 14-5-25.
//  Copyright (c) 2014年 Alex.Chou. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZNavigationViewController.h"
#import "HotIndexViewController.h"
@interface HotViewController : UIViewController
{
    ZNavigationViewController *_navigationController;
    HotIndexViewController *_hotIndexViewController;
}
@end
