//
//  ClassificationView.m
//  爱限免V5
//
//  Created by Alex on 14-5-25.
//  Copyright (c) 2014年 Alex.Chou. All rights reserved.
//

#import "ClassificationView.h"
#import "Header.h"

@implementation ClassificationView
@synthesize tableView = _tableView;
- (void)dealloc
{
    [_tableView release];
    _tableView = nil;
    [super dealloc];
}
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        [self ui_Config];
    }
    return self;
}

-(void)ui_Config
{
    self.backgroundColor = [UIColor whiteColor];
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0,0,kScreenWidth,kScreenHeight-64) style:UITableViewStylePlain];
    [self addSubview:_tableView];
}

/*
 // Only override drawRect: if you perform custom drawing.
 // An empty implementation adversely affects performance during animation.
 - (void)drawRect:(CGRect)rect
 {
 // Drawing code
 }
 */

@end
