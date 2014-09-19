//
//  InstallView.m
//  爱限免V5
//
//  Created by Alex on 14-5-25.
//  Copyright (c) 2014年 Alex.Chou. All rights reserved.
//

#import "InstallView.h"

@implementation InstallView
@synthesize tableView = _tableView;
-(void)dealloc
{
    [_imageArray release];
    _imageArray = nil;
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
    _titleStrArray = @[@"我的设置",@"我的关注",@"我的收藏",@"我的下载",@"我的评论",@"更多信息"];
    
    _imageArray = [[NSMutableArray alloc] init];
    for (int i = 0; i<6; i++) {
        UIImage *img = [UIImage imageNamed:[NSString stringWithFormat:@"9.设置_0%d.png",i+1]];
        [_imageArray addObject:img];
    }
    UIImageView *imgView = [[UIImageView alloc] initWithFrame:CGRectMake(8, 15, 304,[UIScreen mainScreen].bounds.size.height-140)];
    imgView.image = [UIImage imageNamed:@"背景.png"];
    imgView.contentMode = UIViewContentModeScaleToFill;
    imgView.userInteractionEnabled = YES;
    [self addSubview:imgView];
    
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, 304,[UIScreen mainScreen].bounds.size.height-140) style:UITableViewStylePlain];
    _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    _tableView.dataSource = self;
    _tableView.scrollEnabled = NO;
    _tableView.backgroundColor = [UIColor clearColor];
    [imgView addSubview:_tableView];
}
#pragma -mark UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [_titleStrArray count];
}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellID = @"cellID";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    }
    cell.imageView.image = _imageArray[indexPath.row];
    cell.backgroundColor = [UIColor clearColor];
    cell.selectionStyle = UITableViewCellSelectionStyleGray;
    cell.textLabel.text = _titleStrArray[indexPath.row];
    
    return cell;
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