//
//  MyInstallViewController.m
//  爱限免V5
//
//  Created by Alex on 14-5-25.
//  Copyright (c) 2014年 Alex.Chou. All rights reserved.
//

#import "MyInstallViewController.h"

@interface MyInstallViewController ()

@end

@implementation MyInstallViewController
- (void)dealloc
{
    [_myInstallView release];
    _myInstallView = nil;
    [super dealloc];
}
- (id)init
{
    self = [super init];
    if (self)
    {
        self.navigationItem.title = @"我的设置";
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    _myInstallView = [[MyInstallView alloc] initWithFrame:self.view.frame];
    _myInstallView.tableView.delegate = self;
    self.view = _myInstallView;
    
	// Do any additional setup after loading the view.
}
#pragma -mark UITableViewDelegate
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
        return tableView.frame.size.height/3;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
