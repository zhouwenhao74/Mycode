//
//  LimitTypeIndexView.m
//  爱限免V5
//
//  Created by Alex on 14-5-25.
//  Copyright (c) 2014年 Alex.Chou. All rights reserved.
//

#import "LimitTypeIndexView.h"
#import "Header.h"
@implementation LimitTypeIndexView
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
        _ztableView = [[ZTableview alloc] initWithFrame:CGRectMake(0,0,kScreenWidth,kScreenHeight-64) style:UITableViewStylePlain];
        _ztableView.useSearchHeader = YES;
        [self addSubview:_ztableView];
    }
    return self;
}


@end
