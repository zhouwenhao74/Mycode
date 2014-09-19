//
//  MainViewController.m
//  爱限免V5
//
//  Created by Alex on 14-5-25.
//  Copyright (c) 2014年 Alex.Chou. All rights reserved.
//

#import "MainViewController.h"
#import "LimitTypeViewController.h"
#import "ReduceViewController.h"
#import "FreeViewController.h"
#import "SubjectViewController.h"
#import "HotViewController.h"
@implementation MainView


- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self != nil)
    {
        
    }
    
    return self;
}
@end



@interface MainViewController ()
{
    MainView *_mainView;
    UITabBarController *_tabBarController;
    LimitTypeViewController *_limitTypeViewController;
    ReduceViewController *_reduceViewController;
    FreeViewController *_freeViewController;
    SubjectViewController *_subjectViewController;
    HotViewController *_hotViewController;
}
@end

@implementation MainViewController
- (void)dealloc
{
    [_mainView release];
    _mainView = nil;
    [self ai_Unload];
    
    
    [super dealloc];
}

- (id)init
{
    self = [super init];
    if (self)
    {
        
    }
    return self;
}
- (UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}
- (void)loadView
{
    [super loadView];
    _limitTypeViewController = [[LimitTypeViewController alloc] init];
    _reduceViewController = [[ReduceViewController alloc] init];
    _freeViewController = [[FreeViewController alloc] init];
    _subjectViewController = [[SubjectViewController alloc] init];
    _hotViewController = [[HotViewController alloc] init];
    
    NSArray *array = [NSArray arrayWithObjects:_limitTypeViewController,_reduceViewController,_freeViewController,_subjectViewController,_hotViewController, nil];
    _tabBarController = [[UITabBarController alloc] init];
    _tabBarController.viewControllers = array;
    _tabBarController.tabBar.tintColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"6.应用详情_0.png"]];
    _tabBarController.delegate = self;
    [self.view addSubview:_tabBarController.view];
    [UITabBar appearance].barTintColor = [UIColor whiteColor];
    [_tabBarController.tabBar setTranslucent:NO];
    //    [self ai_Unload];
    
}
-(void)ai_Unload
{
    [_tabBarController release];
    _tabBarController = nil;
    
    [_limitTypeViewController release];
    _limitTypeViewController = nil;
    
    [_reduceViewController release];
    _reduceViewController = nil;
    
    [_freeViewController release];
    _freeViewController = nil;
    
    [_subjectViewController release];
    _subjectViewController = nil;
    
    [_hotViewController release];
    _hotViewController = nil;
    
}
#pragma -mark UITabBarControllerDelegate 方法
- (void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController
{
    //    if (viewController != _subjectViewController) {
    //        [_subjectViewController Ai_UnloadView];
    //    }
    //    if (viewController != _limitTypeViewController) {
    //        [_limitTypeViewController Ai_UnloadView];
    //    }
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

