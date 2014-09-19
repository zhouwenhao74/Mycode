//
//  FreeViewController.m
//  爱限免V5
//
//  Created by Alex on 14-5-25.
//  Copyright (c) 2014年 Alex.Chou. All rights reserved.
//

#import "FreeViewController.h"

@interface FreeViewController ()

@end

@implementation FreeViewController
-(void)dealloc
{
    
    [self qf_unloadView];
    [super dealloc];
}
-(void)qf_unloadView
{
    [_freeIndexViewController release];
    _freeIndexViewController = nil;
    [_navigationController release];
    _navigationController = nil;
}

- (id)init
{
    self = [super init];
    if (self) {
        self.tabBarItem = [[[UITabBarItem alloc] initWithTitle:@"免费" image:[UIImage imageNamed:@"btn_免费_正常.png"] selectedImage:[UIImage imageNamed:@"btn_免费_点击.png"]] autorelease];
    }
    return self;
}

- (void)loadView
{
    [super loadView];
    _freeIndexViewController = [[FreeIndexViewController alloc] init];
    _navigationController = [[ZNavigationViewController alloc] initWithRootViewController:_freeIndexViewController];
    
    [self.view addSubview:_navigationController.view];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
