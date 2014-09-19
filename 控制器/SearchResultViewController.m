//
//  SearchResultViewController.m
//  爱限免V5
//
//  Created by Alex on 14-5-25.
//  Copyright (c) 2014年 Alex.Chou. All rights reserved.
//

#import "SearchResultViewController.h"
#import "Header.h"
#import "QFHttpRequest.h"
#import "CONST.h"
#import "AppFreeTableViewCell.h"
#import "IAPP_NS_ENM .h"
#import "AppInformationViewController.h"
static NSUInteger Ex_SearchPage = 1;
@implementation SearchResultViewController
-(void)dealloc
{
    [_searchDataArray release];
    _searchDataArray = nil;
    [_limitSearchResultView release];
    _limitSearchResultView = nil;
    [_searchString release];
    _searchString = nil;
    [super dealloc];
}

- (id)initWithSearchString:(NSString *)searchString
{
    self = [super init];
    if (self)
    {
        _searchDataArray = [[NSMutableArray alloc] init];
        _searchString = [searchString copy];
        self.navigationItem.title = @"搜索结果";
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self ui_Config];
}
-(void)ui_Config
{
    _limitSearchResultView = [[LimitSearchResultView alloc] initWithFrame:self.view.frame];
    _limitSearchResultView.ztableView.delegate = self;
    _limitSearchResultView.ztableView.dataSource = self;
    self.view = _limitSearchResultView;
    [self getDataFromNetWithStr:_searchString withType:ReloadDataType withFinishCompletion:^(BOOL finished) {
        [_limitSearchResultView.ztableView reloadData];
    }];
}
#pragma -mark AiTableViewDataSource 方法
-(void)zTableView:(ZTableview *)zTableView dataSourceRefreshCompletion:(void (^)(BOOL finished)) completion
{
    [self getDataFromNetWithStr:_searchString withType:ReloadDataType withFinishCompletion:completion];
    
}
-(void)zTableView:(ZTableview *)zTableView dataSourceLoadMoreCompletion:(void (^)(BOOL finished))completion
{
    [self getDataFromNetWithStr:_searchString withType:AddDataType withFinishCompletion:completion];
}
#pragma -mark UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [_searchDataArray count];
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    NSString *cellID = @"cellSearch";
    AppFreeTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (cell == nil)
    {
        cell = [[[AppFreeTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID] autorelease];
    }
    NSUInteger row = indexPath.row;
    [cell setCellNumber:row+1];
    LimitTypeIndexIAppInformationModel *AppInformationModel = [[LimitTypeIndexIAppInformationModel alloc] initWithDictionary:_searchDataArray[row]];
    cell.AppInformationModel = AppInformationModel;
    [AppInformationModel release];
    return cell;
    
    
}
#pragma -mark UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 100;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    LimitTypeIndexIAppInformationModel *AppInformationModel = [[LimitTypeIndexIAppInformationModel alloc] initWithDictionary:_searchDataArray[indexPath.row]];
    AppInformationViewController *appInformationViewController = [[AppInformationViewController alloc] initWithAppId:AppInformationModel.appIDStr iconUrlString:AppInformationModel.leftOfImageViewImageUrl appNameStr:AppInformationModel.appName];
    [self.navigationController pushViewController:appInformationViewController animated:YES];
    [appInformationViewController release];
    [AppInformationModel release];
    
}
#pragma -mark从网络加载更多数据
-(void)getDataFromNetWithStr:(NSString *)str withType:(LoadDataType)loadData withFinishCompletion:(void (^)(BOOL finished)) completion
{
    if (loadData == ReloadDataType)
    {
        Ex_SearchPage = 1;
        NSString *urlStr = [[NSString stringWithFormat:@"http://1000phone.net:8088/app/iAppFree/api/limited.php?page=%d&number=20&search=%@",Ex_SearchPage,str] stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
        [QFHttpRequest requestWithUrlString:urlStr finish:^(NSData *data)
         {
             [_searchDataArray removeAllObjects];
             NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
             
             NSArray *array = dic[@"applications"];
             for (int i = 0; i<array.count; i++) {
                 [_searchDataArray  addObject:array[i]];
             };
             if (completion != nil) {
                 completion(YES);
             }
             
         } error:^(NSError *error) {
             NSLog(@"error= %@",error);
             if (completion != nil) {
                 completion(YES);
             }
         }];
        return;
    }
    if (loadData == AddDataType)
    {
        Ex_SearchPage = Ex_SearchPage + 1;
        NSString *urlStr = [[NSString stringWithFormat:@"http://1000phone.net:8088/app/iAppFree/api/limited.php?page=%d&number=20&search=%@",Ex_SearchPage,str] stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
        [QFHttpRequest requestWithUrlString:urlStr finish:^(NSData *data)
         {
             NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
             
             NSArray *array = dic[@"applications"];
             for (int i = 0; i<array.count; i++)
             {
                 [_searchDataArray  addObject:array[i]];
             };
             if (completion != nil) {
                 completion(YES);
             }
         } error:^(NSError *error)
         {
             NSLog(@"error= %@",error);
             if (completion != nil) {
                 completion(YES);
             }
         }];
        return;
    }
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
