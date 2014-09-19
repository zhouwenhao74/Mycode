//
//  DownLoadsViewController.m
//  爱限免V5
//
//  Created by Alex on 14-5-25.
//  Copyright (c) 2014年 Alex.Chou. All rights reserved.
//

#import "DownLoadsViewController.h"
#import "AppIconButton.h"
#import "AppInformationViewController.h"
@interface DownLoadsViewController ()

@end

@implementation DownLoadsViewController
- (void)dealloc
{
    [_myDownLoadsView release];
    _myDownLoadsView =nil;
    [super dealloc];
}

- (id)init
{
    self = [super init];
    if (self) {
        self.navigationItem.title = @"我的下载";
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    _myDownLoadsView = [[DownLoadsView alloc] initWithFrame:self.view.frame];
    _myDownLoadsView.delegate = self;
    self.view = _myDownLoadsView;
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)showAppInformationViewController:(AppIconButton *)appIconButton
{
    AppInformationViewController *appInformationViewController = [[AppInformationViewController alloc] initWithAppId:appIconButton.appIconButtonModel.appIDStr iconUrlString:appIconButton.appIconButtonModel.iconUrlStr appNameStr:appIconButton.appIconButtonModel.appNameStr];
    [self.navigationController pushViewController:appInformationViewController animated:YES];
    [appInformationViewController release];
}
@end
