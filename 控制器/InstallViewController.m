//
//  InstallViewController.m
//  爱限免V5
//
//  Created by Alex on 14-5-25.
//  Copyright (c) 2014年 Alex.Chou. All rights reserved.
//

#import "InstallViewController.h"
#import "MyInstallViewController.h"
#import "FavoritesViewController.h"
#import "DownLoadsViewController.h"
#import "SharedViewController.h"
@interface InstallViewController ()

@end

@implementation InstallViewController
- (void)dealloc
{
    [_inStallView release];
    _inStallView = nil;
    [super dealloc];
}

- (id)init
{
    self = [super init];
    if (self) {
        self.navigationItem.title = @"设置";
    }
    return self;
}

- (void)loadView
{
    [super loadView];
    _inStallView = [[InstallView alloc] initWithFrame:self.view.frame];
    _inStallView.tableView.delegate =  self;
    self.view = _inStallView;
    
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma -mark UITableViewDelegate
-(void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0) {
        MyInstallViewController *myInstallViewController = [[MyInstallViewController alloc] init];
        [self.navigationController pushViewController:myInstallViewController animated:YES];
        [myInstallViewController release];
    }
    if (indexPath.row == 1) {
        SharedViewController *mySharedViewController = [[SharedViewController alloc] init];
        [self.navigationController pushViewController:mySharedViewController animated:YES];
        [mySharedViewController release];
    }
    if (indexPath.row == 2 ) {
        FavoritesViewController *myFavoritesViewController = [[FavoritesViewController alloc] init];
        [self.navigationController pushViewController:myFavoritesViewController animated:YES];
        [myFavoritesViewController release];
    }
    if (indexPath.row == 3) {
        DownLoadsViewController *myDownLoadsViewController = [[DownLoadsViewController alloc] init];
        [self.navigationController pushViewController:myDownLoadsViewController animated:YES];
        [myDownLoadsViewController release];
    }
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return _inStallView.tableView.frame.size.height/6;
}
@end
