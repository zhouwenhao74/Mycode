//
//  DetailClassificationViewController.m
//  爱限免V5
//
//  Created by Alex on 14-5-25.
//  Copyright (c) 2014年 Alex.Chou. All rights reserved.
//

#import "DetailClassificationViewController.h"
#import "Header.h"
#import "QFHttpRequest.h"
#import "CONST.h"
#import "AppFreeTableViewCell.h"
#import "LimitTypeIndexIAppInformationModel.h"
#import "AppInformationViewController.h"
#import "SearchResultViewController.h"
static NSUInteger Ex_Page = 1;
//static NSUInteger Ex_Number = 30;
@interface DetailClassificationViewController ()

@end

@implementation DetailClassificationViewController
- (void)dealloc
{
    [_navigationTitle release];
    _navigationTitle = nil;
    [_categoryIdStr release];
    _categoryIdStr = nil;
    [_detailClassificationView release];
    _detailClassificationView = nil;
    [_dataSourceArray release];
    _dataSourceArray = nil;
    [super dealloc];
}

-(id)initWithCategoryIdStr:(NSString*)categoryIdStr NavigationTitle:(NSString*)navigationTitle type:(ClassificationType)classificationType
{
    self = [super init];
    if (self)
    {
        _dataSourceArray = [[NSMutableArray alloc] init];
        _navigationTitle = [navigationTitle copy];
        _categoryIdStr = [categoryIdStr copy];
        _classificationType = classificationType;
        self.navigationItem.title = _navigationTitle;
        
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    _detailClassificationView = [[DetailClassificationView alloc] init];
    self.view = _detailClassificationView;
    _detailClassificationView.ztableView.dataSource = self;
    _detailClassificationView.ztableView.delegate = self;
    _detailClassificationView.ztableView.searchBarDelegate = self;
    [self getDataFromNetWithArray:_dataSourceArray withType:ReloadDataType withFinishCompletion:^(BOOL finished) {
        [_detailClassificationView.ztableView reloadData];
    }];
	// Do any additional setup after loading the view.
}
#pragma 导航栏自定义backbutton事件函数
-(void)popViewController:(id)sender
{
    [self.navigationController popViewControllerAnimated:YES];
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
    searchBar.showsCancelButton = NO;
    [searchBar resignFirstResponder];
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
        [QFHttpRequest requestWithUrlString:[self creatUrlWiht:Ex_Page] finish:^(NSData *data)
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
        [QFHttpRequest requestWithUrlString:[self creatUrlWiht:Ex_Page] finish:^(NSData *data)
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
#pragma -mark 合成网络请求地址
-(NSString*)creatUrlWiht:(NSUInteger)page
{
    if (_classificationType == Type_LIMIT) {
        NSString *str= [NSString stringWithFormat:@"%@%@",APPCATE_LIMIT(page),_categoryIdStr];
        return str;
    }
    if (_classificationType == Type_FREE) {
        NSString *str= [NSString stringWithFormat:@"%@%@",APPCATE_FREE(page),_categoryIdStr];
        return str;
    }
    if (_classificationType == Type_SALE) {
        NSString *str= [NSString stringWithFormat:@"%@%@",APPCATE_SALE(page),_categoryIdStr];
        return str;
    }
    if (_classificationType == Type_HOT) {
        NSString *str= [NSString stringWithFormat:@"%@%@",APPCATE_HOT(page),_categoryIdStr];
        return str;
    }
    return nil;
    
    
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
