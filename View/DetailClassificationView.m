//
//  DetailClassificationView.m
//  爱限免V5
//
//  Created by Alex on 14-5-25.
//  Copyright (c) 2014年 Alex.Chou. All rights reserved.
//

#import "DetailClassificationView.h"
#import "Header.h"
@implementation DetailClassificationView
@synthesize ztableView = _ztableView;
- (void)dealloc
{
    [_ztableView release];
    _ztableView = nil;
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
    _ztableView = [[ZTableview alloc] initWithFrame:CGRectMake(0,0,kScreenWidth,kScreenHeight-64) style:UITableViewStylePlain];
    _ztableView.useSearchHeader = YES;
    [self addSubview:_ztableView];
    
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

