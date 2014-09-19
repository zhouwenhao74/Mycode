//
//  SubjectIndexViewController.m
//  爱限免V5
//
//  Created by Alex on 14-5-25.
//  Copyright (c) 2014年 Alex.Chou. All rights reserved.
//

#import "SubjectIndexViewController.h"
#import "QFHttpRequest.h"
#import "SubjectIndexCell.h"
#import "CONST.h"
#import "AppInformationViewController.h"
@interface SubjectIndexViewController ()<ZTableViewDataSource>
{
    NSMutableArray *_tableDataArray;
}

@end

@implementation SubjectIndexViewController
#pragma -mark 析构函数 构造函数
-(void)dealloc
{
    [_subjectIndexView release];
    _subjectIndexView = nil;
    [_tableDataArray release];
    _tableDataArray = nil;
    [super dealloc];
}
- (id)init
{
    self = [super init];
    if (self) {
        self.navigationItem.title = @"专题";
        _tableDataArray = [[NSMutableArray alloc] init];
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    _subjectIndexView= [[SubjectIndexView alloc] initWithFrame:self.view.frame];
    _subjectIndexView.zTableview.dataSource = self;
    _subjectIndexView.zTableview.delegate = self;
    self.view = _subjectIndexView;
    [self getDataFromNetWithCompletion:^(BOOL finished,NSData *data) {
        if (data != nil) {
            id json = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
            NSArray *array = json;
            for (int i = 0; i<[array count]; i++) {
                [_tableDataArray addObject:array[i]];
            }
            [_subjectIndexView.zTableview reloadData];
        }
    }];
    
	// Do any additional setup after loading the view.
}
#pragma -mark qf_unloadView
-(void)qf_unloadView
{
    
}
#pragma -mark AiTableViewDelegate 函数
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 290;
}
#pragma -mark AiTableViewDataSource 函数
-(void)zTableView:(ZTableview *)aiTableView dataSourceRefreshCompletion:(void (^)(BOOL finished)) completion
{
    
}
-(void)zTableView:(ZTableview *)aiTableView dataSourceLoadMoreCompletion:(void (^)(BOOL finished))completion
{
    
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [_tableDataArray count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellID = @"cell";
    SubjectIndexCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (cell == nil) {
        cell = [[[SubjectIndexCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID] autorelease];
    }
    SubjectModel *model = [[SubjectModel alloc] initWithDictionary:_tableDataArray[indexPath.row]];
    cell.model = model;
    for (int i = 0; i<cell.appIntroduceBtArray.count; i++) {
        AppIntroduceButton *appIntroduceButton =(AppIntroduceButton *) cell.appIntroduceBtArray[i];
        [appIntroduceButton addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    [model release];
    return cell;
}
#pragma -mark 按钮点击事件
-(void)buttonClick:(id)sender
{
    AppIntroduceButton *appBt = (AppIntroduceButton*)sender;
    AppInformationViewController *appInformationView = [[AppInformationViewController alloc] initWithAppId:appBt.model.appIDStr iconUrlString:appBt.model.iconUrl appNameStr:appBt.model.name];
    [self.navigationController pushViewController:appInformationView animated:YES];
    [appInformationView release];
    
}
#pragma -mark 从网络加载数据
-(void)getDataFromNetWithCompletion:(void (^)(BOOL finished,NSData *data))completion
{
    [QFHttpRequest requestWithUrlString:SUBJECT_URL finish:^(NSData *data) {
        
        
        if (completion != nil) {
            completion(YES,data);
        }
    } error:^(NSError *error) {
        NSLog(@"error= %@",error);
        if (completion != nil) {
            
            completion(YES,nil);
        }
    }];
}
#pragma -mark 内存警告
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
