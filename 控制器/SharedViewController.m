//
//  SharedViewController.m
//  爱限免V5
//
//  Created by Alex on 14-5-25.
//  Copyright (c) 2014年 Alex.Chou. All rights reserved.
//

#import "SharedViewController.h"

@interface SharedViewController ()

@end

@implementation SharedViewController
- (void)dealloc
{
    [_mySharedView release];
    _mySharedView = nil;
    [super dealloc];
}

- (id)init
{
    self = [super init];
    if (self)
    {
        self.navigationItem.title = @"我的关注";
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    _mySharedView = [[SharedView alloc] initWithFrame:self.view.frame];
    self.view = _mySharedView;
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
