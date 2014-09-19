//
//  ReduceViewController.m
//  爱限免V5
//
//  Created by Alex on 14-5-25.
//  Copyright (c) 2014年 Alex.Chou. All rights reserved.
//

#import "ReduceViewController.h"

@interface ReduceViewController ()

@end

@implementation ReduceViewController
-(void)dealloc
{
    
    [self qf_unloadView];
    [super dealloc];
}
-(void)qf_unloadView
{
    [_reduceIndexViewController release];
    _reduceIndexViewController = nil;
    [_navigationController release];
    _navigationController = nil;
}
- (id)init
{
    self = [super init];
    if (self) {
        self.tabBarItem = [[[UITabBarItem alloc] initWithTitle:@"降价" image:[UIImage imageNamed:@"btn_降价_正常.png"] selectedImage:[UIImage imageNamed:@"btn_降价_点击.png"]] autorelease];
    }
    return self;
}

- (void)loadView
{
    [super loadView];
    _reduceIndexViewController = [[ReduceIndexViewController alloc] init];
    _navigationController = [[ZNavigationViewController alloc] initWithRootViewController:_reduceIndexViewController];
    
    [self.view addSubview:_navigationController.view];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
