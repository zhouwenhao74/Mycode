//
//  ReduceIndexViewController.m
//  爱限免V5
//
//  Created by Alex on 14-5-25.
//  Copyright (c) 2014年 Alex.Chou. All rights reserved.
//

#import "ReduceIndexViewController.h"
#import "Header.h"
#import "QFHttpRequest.h"
#import "CONST.h"
#import "AppFreeTableViewCell.h"
#import "LimitTypeIndexIAppInformationModel.h"
#import "IAPP_NS_ENM .h"
#import "AppInformationViewController.h"
#import "SearchResultViewController.h"
#import "InstallViewController.h"
#import "ClassificationViewController.h"
static NSUInteger Ex_Page = 1;
static NSUInteger Ex_Number = 30;

@interface ReduceIndexViewController ()<ZTableViewDataSource>
{
    //存放显示数据
    NSMutableArray *_dataSourceArray;
    //存放搜索数据
    NSMutableArray *_searchDataArray;
}
@end

@implementation ReduceIndexViewController
- (void)dealloc
{
    [self ai_ViewUnload];
    [_dataSourceArray release];
    _dataSourceArray = nil;
    [super dealloc];
}
- (id)init
{
    self = [super init];
    if (self) {
        _dataSourceArray = [[NSMutableArray alloc] init];
        self.navigationItem.title = @"降价";
        //添加两个按钮
        UIBarButtonItem *rightButton = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"btn_设置_正常.png"]  landscapeImagePhone:[UIImage imageNamed:@"btn_设置_点击.png"]  style:UIBarButtonItemStylePlain target:self action:@selector(showInstallView:)];
        self.view.backgroundColor = [UIColor whiteColor];
        self.navigationItem.rightBarButtonItem = rightButton;
        [rightButton release];
        
        UIBarButtonItem *leftButton = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"btn_分类_正常.png"]  landscapeImagePhone:[UIImage imageNamed:@"btn_分类_点击.png"]  style:UIBarButtonItemStylePlain target:self action:@selector(showClassificationView:)];
        
        self.navigationItem.leftBarButtonItem = leftButton;
        [leftButton release];
        
        
    }
    return self;
}

- (void)loadView
{
    [super loadView];
    [self ui_Config];
	// Do any additional setup after loading the view.
}
-(void)ui_Config
{
    self.view.backgroundColor = [UIColor whiteColor];
    _limitTypeIndexView = [[LimitTypeIndexView alloc] initWithFrame:self.view.frame];
    _limitTypeIndexView.ztableView.dataSource = self;
    _limitTypeIndexView.ztableView.delegate = self;
    _limitTypeIndexView.ztableView.searchBarDelegate = self;
    self.view = _limitTypeIndexView;
    [self getDataFromNetWithArray:_dataSourceArray withType:ReloadDataType withFinishCompletion:^(BOOL finished) {
        [_limitTypeIndexView.ztableView reloadData];
    }];
    
}
#pragma -mark 分类和设置按钮被按下事件函数
-(void)showInstallView:(id)sender
{
    InstallViewController *installViewController = [[InstallViewController alloc] init];
    [self.navigationController pushViewController:installViewController animated:YES];
    [installViewController release];
    
}
-(void)showClassificationView:(id)sender
{
    ClassificationViewController *classificationViewController = [[ClassificationViewController alloc] init];
    [self.navigationController pushViewController:classificationViewController animated:YES];
    [classificationViewController release];
    
}
#pragma -mark UISearchBarDelegate method
- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar
{
    SearchResultViewController *searchResultViewController = [[SearchResultViewController alloc] initWithSearchString:searchBar.text];
    searchResultViewController.view.layer.transform = CATransform3DTranslate(searchResultViewController.view.layer.transform, 0, [UIScreen mainScreen].bounds.size.height, 0);
    [self.navigationController pushViewController:searchResultViewController animated:YES];
    [UIView animateWithDuration:0.5 animations:^{
        searchResultViewController.view.layer.transform = CATransform3DIdentity;
    } completion:^(BOOL finished) {
        [searchResultViewController release];
        
    }];
    [searchBar resignFirstResponder];
    searchBar.showsCancelButton = NO;
    searchBar.text = nil;
    
    
}
- (void)searchBarCancelButtonClicked:(UISearchBar *) searchBar
{
    [searchBar resignFirstResponder];
    searchBar.showsCancelButton = NO;
    searchBar.text = nil;
    
}
- (void)searchBarTextDidBeginEditing:(UISearchBar *)searchBar
{
    searchBar.showsCancelButton = YES;
}
#pragma -mark UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [_dataSourceArray count];
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *cellID = @"cell";
    AppFreeTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (cell == nil)
    {
        cell = [[[AppFreeTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID] autorelease];
    }
    NSUInteger row = indexPath.row;
    [cell setCellNumber:row+1];
    LimitTypeIndexIAppInformationModel *AppInformationModel = [[LimitTypeIndexIAppInformationModel alloc] initWithDictionary:_dataSourceArray[row]];
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
    LimitTypeIndexIAppInformationModel *AppInformationModel = [[LimitTypeIndexIAppInformationModel alloc] initWithDictionary:_dataSourceArray[indexPath.row]];
    AppInformationViewController *appInformationViewController = [[AppInformationViewController alloc] initWithAppId:AppInformationModel.appIDStr iconUrlString:AppInformationModel.leftOfImageViewImageUrl appNameStr:AppInformationModel.appName];
    [self.navigationController pushViewController:appInformationViewController animated:YES];
    [appInformationViewController release];
    [AppInformationModel release];
}

#pragma -mark AiTableViewDataSource 方法
-(void)zTableView:(ZTableview *)aiTableView dataSourceRefreshCompletion:(void (^)(BOOL finished)) completion
{
    [self getDataFromNetWithArray:_dataSourceArray withType:ReloadDataType withFinishCompletion:completion];
}
-(void)zTableView:(ZTableview *)aiTableView dataSourceLoadMoreCompletion:(void (^)(BOOL finished))completion
{
    [self getDataFromNetWithArray:_dataSourceArray withType:AddDataType withFinishCompletion:completion];
}
#pragma -mark 从网络获取首页数据

-(void)getDataFromNetWithArray:(NSMutableArray *)dateArray withType:(LoadDataType)loadData withFinishCompletion:(void (^)(BOOL finished)) completion
{
    if (loadData == ReloadDataType) {
        Ex_Page = 1;
        [QFHttpRequest requestWithUrlString:REDUCE_URL(Ex_Page, Ex_Number) finish:^(NSData *data)
         {
             [dateArray removeAllObjects];
             NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
             
             NSArray *array = dic[@"applications"];
             for (int i = 0; i<array.count; i++) {
                 [dateArray  addObject:array[i]];
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
    if (loadData == AddDataType)
    {
        Ex_Page = Ex_Page + 1;
        [QFHttpRequest requestWithUrlString:REDUCE_URL(Ex_Page, Ex_Number) finish:^(NSData *data)
         {
             NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
             
             NSArray *array = dic[@"applications"];
             for (int i = 0; i<array.count; i++)
             {
                 [dateArray  addObject:array[i]];
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
-(void)ai_ViewUnload
{
    [_limitTypeIndexView release];
    _limitTypeIndexView = nil;
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
