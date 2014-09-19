//
//  ZNavigationViewController.m
//  爱限免V5
//
//  Created by Alex on 14-5-25.
//  Copyright (c) 2014年 Alex.Chou. All rights reserved.
//

#import "ZNavigationViewController.h"

@interface ZNavigationViewController ()

@end

@implementation ZNavigationViewController

- (id)initWithRootViewController:(UIViewController *)rootViewController
{
    self = [super initWithRootViewController:rootViewController];
    if (self) {
        //改变导航栏的颜色
        [UINavigationBar appearance].barTintColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"6.应用详情_0.png"]];
        [self.navigationBar setTranslucent:NO];
        
        //改变状态栏的字体颜色和大小
        UIColor *cc = [UIColor whiteColor];
        UIFont *font = [UIFont fontWithName:@"Helvetica" size:20];
        NSDictionary * dict = [NSDictionary dictionaryWithObjectsAndKeys:font,NSFontAttributeName,cc,NSForegroundColorAttributeName, nil];
        self.navigationBar.titleTextAttributes = dict;
        self.navigationBar.tintColor = [UIColor whiteColor];
        
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
@end

