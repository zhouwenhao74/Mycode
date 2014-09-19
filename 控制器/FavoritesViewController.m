//
//  FavoritesViewController.m
//  爱限免V5
//
//  Created by Alex on 14-5-25.
//  Copyright (c) 2014年 Alex.Chou. All rights reserved.
//

#import "FavoritesViewController.h"
#import "AppIconButton.h"
#import "AppInformationViewController.h"
@interface FavoritesViewController ()

@end

@implementation FavoritesViewController
- (void)dealloc
{
    [_myFavoritesView release];
    _myFavoritesView =nil;
    [super dealloc];
}

- (id)init
{
    self = [super init];
    if (self) {
        self.navigationItem.title = @"我的收藏";
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    _myFavoritesView = [[FavoritesView alloc] initWithFrame:self.view.frame];
    _myFavoritesView.delegate = self;
    self.view = _myFavoritesView;
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
