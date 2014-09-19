//
//  HotViewController.m
//  爱限免V5
//
//  Created by Alex on 14-5-25.
//  Copyright (c) 2014年 Alex.Chou. All rights reserved.
//

#import "HotViewController.h"

@interface HotViewController ()

@end

@implementation HotViewController
-(void)dealloc
{
    
    [self qf_unloadView];
    [super dealloc];
}
-(void)qf_unloadView
{
    [_hotIndexViewController release];
    _hotIndexViewController = nil;
    [_navigationController release];
    _navigationController = nil;
}

- (id)init
{
    self = [super init];
    if (self) {
        self.tabBarItem = [[[UITabBarItem alloc] initWithTitle:@"热点" image:[UIImage imageNamed:@"btn_热点_正常.png"] selectedImage:[UIImage imageNamed:@"btn_热点_点击.png"]] autorelease];
    }
    return self;
}

- (void)loadView
{
    [super loadView];
    _hotIndexViewController = [[HotIndexViewController alloc] init];
    _navigationController = [[ZNavigationViewController alloc] initWithRootViewController:_hotIndexViewController];
    
    [self.view addSubview:_navigationController.view];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
