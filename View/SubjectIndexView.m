//
//  SubjectIndexView.m
//  爱限免V5
//
//  Created by Alex on 14-5-25.
//  Copyright (c) 2014年 Alex.Chou. All rights reserved.
//

#import "SubjectIndexView.h"
#import "Header.h"
@implementation SubjectIndexView
@synthesize zTableview = _zTableview;
#pragma -mark 析构函数 构造函数

-(void)dealloc
{
    [_zTableview release];
    _zTableview = nil;
    
    [super dealloc];
}
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self!= nil)
    {
        _zTableview = [[ZTableview alloc] initWithFrame:CGRectMake(0, 0, frame.size.width, frame.size.height-64) style:UITableViewStylePlain];
        [self addSubview:_zTableview];
    }
    return self;
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

