//
//  MyInstallView.m
//  爱限免V5
//
//  Created by Alex on 14-5-25.
//  Copyright (c) 2014年 Alex.Chou. All rights reserved.
//

#import "MyInstallView.h"
@implementation MyInstallView
@synthesize tableView = _tableView;
- (void)dealloc
{
    [_tableView  release];
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
    UIImageView *tableBackImagView1 = [[UIImageView alloc] initWithFrame:CGRectMake(20, 10, 280, [UIScreen mainScreen].bounds.size.height*135/568)];
    tableBackImagView1.userInteractionEnabled = YES;
    tableBackImagView1.image = [UIImage imageNamed:@"背景.png"];
    _tableView = [[UITableView alloc] initWithFrame:tableBackImagView1.bounds style:UITableViewStylePlain];
    _tableView.backgroundColor = [UIColor clearColor];
    _tableView.dataSource = self;
    _tableView.scrollEnabled = NO;
    _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [tableBackImagView1 addSubview:_tableView];
    [self addSubview:tableBackImagView1];
    [tableBackImagView1 release];
    
    _tableViewCellStr = @[@"推送设置",@"开启推送通知",@"开启关注通知"];
    _tableViewCellStr = [[NSArray alloc] initWithArray:_tableViewCellStr];
    
}
#pragma -mark UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
        return 3;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *cellID = [NSString stringWithFormat:@"id%d_%d",indexPath.section,indexPath.row];
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
        
            if (indexPath.row != 2)
            {
                UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(3,tableView.frame.size.height/3-2, tableView.frame.size.width-6, 1)];
                imageView.image =  [UIImage imageNamed:@"线.png"];
                [cell addSubview:imageView];
                [imageView release];
            }
            if (indexPath.row == 1||indexPath.row == 2) {
                UISwitch *swithch = [[UISwitch alloc] init];
                swithch.center = CGPointMake(tableView.frame.size.width-40, tableView.frame.size.height/3/2);
                [cell addSubview:swithch];
                [swithch release];
            }
            
        }

    cell.backgroundColor = [UIColor clearColor];
    
    cell.textLabel.text = _tableViewCellStr[indexPath.row];
        
    cell.textLabel.textColor = [UIColor blackColor];
    return cell;
}






@end
