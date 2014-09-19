//
//  LimitTypeViewController.m
//  爱限免V5
//
//  Created by Alex on 14-5-25.
//  Copyright (c) 2014年 Alex.Chou. All rights reserved.
//

#import "LimitTypeViewController.h"
#import "LimitTypeIndexViewController.h"
@interface LimitTypeViewController ()
{
    LimitTypeIndexViewController *_limitTypeIndexViewController;
}
@end

@implementation LimitTypeViewController
- (void)dealloc
{
    
    [self qf_unloadView];
    [super dealloc];
}
- (id)init
{
    self = [super init];
    if (self) {
        
        self.tabBarItem = [[[UITabBarItem alloc] initWithTitle:@"限免" image:[UIImage imageNamed:@"btn_限免_正常.png"] selectedImage:[UIImage imageNamed:@"btn_限免_点击.png"]] autorelease];
    }
    return self;
}
- (void)loadView
{
    [super loadView];
    _limitTypeIndexViewController = [[LimitTypeIndexViewController alloc] init];
    _navigationController = [[ZNavigationViewController alloc] initWithRootViewController:_limitTypeIndexViewController];
    
    [self.view addSubview:_navigationController.view];
    
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)qf_unloadView
{
    self.view = nil;
    [_navigationController release];
    _navigationController = nil;
    
    [_limitTypeIndexViewController release];
    _limitTypeIndexViewController = nil;
}
@end