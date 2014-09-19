//
//  SubjectViewController.m
//  爱限免V5
//
//  Created by Alex on 14-5-25.
//  Copyright (c) 2014年 Alex.Chou. All rights reserved.
//

#import "SubjectViewController.h"

@interface SubjectViewController ()

@end

@implementation SubjectViewController
#pragma -mark 析构函数 构造函数
-(void)dealloc
{
    
    [self qf_unloadView];
    [super dealloc];
}
- (id)init
{
    self = [super init];
    if (self != nil)
    {
        self.tabBarItem = [[[UITabBarItem alloc] initWithTitle:@"专题" image:[UIImage imageNamed:@"btn_专题_正常.png"] selectedImage:[UIImage imageNamed:@"btn_专题_点击.png"]] autorelease];
    }
    return self;
}

-(void)viewDidLoad
{
    
    [super viewDidLoad];
    _subjectIndexViewController = [[SubjectIndexViewController alloc] init];
    _navigationController = [[ZNavigationViewController alloc] initWithRootViewController:_subjectIndexViewController];
    [self.view addSubview:_navigationController.view];
	// Do any additional setup after loading the view.
}
-(void)qf_unloadView
{
    self.view = nil;
    [_navigationController release];
    _navigationController = nil;
    [_subjectIndexViewController release];
    _subjectIndexViewController = nil;
    
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
