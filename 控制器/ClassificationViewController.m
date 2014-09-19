//
//  ClassificationViewController.m
//  爱限免V5
//
//  Created by Alex on 14-5-25.
//  Copyright (c) 2014年 Alex.Chou. All rights reserved.
//

#import "ClassificationViewController.h"
#import "CONST.h"
#import "IAPP_NS_ENM .h"
#import "QFHttpRequest.h"
#import "UIImageView+QFwebImageView.h"
#import "DetailClassificationViewController.h"
@interface ClassificationViewController ()
{
    
}

@end

@implementation ClassificationViewController
- (void)dealloc
{
    [_classificationView release];
    _classificationView = nil;
    [_netDataArray release];
    _netDataArray = nil;
    [super dealloc];
    
}
- (id)init
{
    self = [super init];
    if (self)
    {
        self.navigationItem.title = @"分类";
        _netDataArray = [[NSMutableArray alloc] init];
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    _classificationView = [[ClassificationView alloc] initWithFrame:self.view.frame];
    self.view = _classificationView;
    _classificationView.tableView.delegate = self;
    _classificationView.tableView.dataSource = self;
    [self getDataFromNetWithCompletion:^(BOOL finished, NSData *data) {
        
    }];
	// Do any additional setup after loading the view.
}

#pragma 导航栏自定义backbutton事件函数
-(void)popViewController:(id)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma -mark 从网络获取数据
-(void)getDataFromNetWithCompletion:(void (^)(BOOL finished,NSData *data))completion
{
    [QFHttpRequest requestWithUrlString:APPCATE finish:^(NSData *data) {
        [_netDataArray removeAllObjects];
        id json = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
        for (NSDictionary *dic in json)
        {
            [_netDataArray addObject:dic];
        }
        
        [_classificationView.tableView reloadData];
        if (completion != nil) {
            completion(YES,data);
        }
    } error:^(NSError *error) {
        if (completion != nil) {
            
            completion(YES,nil);
        }
    }];
}
#pragma -makr UITableViewDataSource Method
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    NSString *cellID = [NSString stringWithFormat:@"cellID"];
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellID];
    }
    
    cell.backgroundColor = [UIColor whiteColor];
    [cell.imageView setImageWithUrlString:_netDataArray[indexPath.row][@"picUrl"] placeholderImage:[UIImage imageNamed:@"iapp.png"]];
    cell.textLabel.text = (NSString*)_netDataArray[indexPath.row][@"categoryCname"];
    cell.detailTextLabel.text = [NSString stringWithFormat:@"共 %@ 款应用，其中限制免 %@ 款",_netDataArray[indexPath.row][@"categoryCount"],_netDataArray[indexPath.row][@"limited"]];
    cell.detailTextLabel.font = [UIFont systemFontOfSize:10];
    cell.accessoryType =  UITableViewCellAccessoryDisclosureIndicator;
    //CGRect rect = [tableView rectForRowAtIndexPath:indexPath];
    
    return cell;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    return [_netDataArray count];
}
#pragma -mark UITableViewDelegate Method
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    ClassificationType classificationType = Type_LIMIT;
    NSString *navigationStr = [NSString stringWithFormat:@"限免－%@类",(NSString*)_netDataArray[indexPath.row][@"categoryCname"]];
    DetailClassificationViewController *detailClassificationViewController = [[DetailClassificationViewController alloc] initWithCategoryIdStr:_netDataArray[indexPath.row][@"categoryId"] NavigationTitle:navigationStr type:classificationType];
    [self.navigationController pushViewController:detailClassificationViewController animated:YES];
    [detailClassificationViewController release];
    
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 70;
}


@end
