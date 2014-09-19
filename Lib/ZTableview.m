//
//  ZTableview.m
//  爱限免V5
//
//  Created by Alex on 14-5-25.
//  Copyright (c) 2014年 Alex.Chou. All rights reserved.
//

#import "ZTableview.h"

@implementation ZTableview

@synthesize useSearchHeader = _useSearchHeader;
@synthesize useSearchDisplayController = _useSearchDisplayController;
@synthesize searchBar = _searchBar;
@synthesize searchDisplaycontentsController = _searchDisplaycontentsController;
@synthesize searchDisplayController = _searchDisplayController;

- (id)initWithFrame:(CGRect)frame style:(UITableViewStyle)style
{
    self = [super initWithFrame:frame style:style];
    if (self != nil) {
        //初始化方法
        _egoRefreshTableHeaderView = [[EGORefreshTableHeaderView alloc] initWithFrame:CGRectMake(0, - self.frame.size.height,  self.frame.size.width, self.frame.size.height)];
        _egoRefreshTableHeaderView.delegate = self;
        [self addSubview:_egoRefreshTableHeaderView];
        _isRefreshing = NO;
        
        _loadMoreTableFooterView = [[LoadMoreTableFooterView alloc] initWithFrame:CGRectMake(0, self.contentSize.height,  self.frame.size.width,  self.frame.size.height)];
        _loadMoreTableFooterView.delegate = self;
        [self addSubview:_loadMoreTableFooterView];
        _isLoading = NO;
        
    }
    return self;
}
#pragma -mark 析构
-(void)dealloc
{
    [_egoRefreshTableHeaderView release];
    _egoRefreshTableHeaderView = nil;
    
    [_loadMoreTableFooterView release];
    _loadMoreTableFooterView = nil;
    
    [_searchBar release];
    _searchBar = nil;
    
    [_searchDisplayController release];
    _searchDisplayController = nil;
    [_searchDisplaycontentsController release];
    _searchDisplaycontentsController = nil;
    [super dealloc];
}

#pragma -mark UITableViewDelegate method
//重写父类的delegate的set方法
-(void)setDelegate:(id<UITableViewDelegate>)delegate
{
    [super setDelegate:self];
    _backUpDelegate = delegate;
}
-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    [_egoRefreshTableHeaderView egoRefreshScrollViewDidScroll:scrollView];
    [_loadMoreTableFooterView loadMoreScrollViewDidScroll:scrollView];
    if ([_backUpDelegate respondsToSelector:@selector(scrollViewDidScroll:)]){
        [_backUpDelegate scrollViewDidScroll:scrollView];
    }
}
-(void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{
    [_egoRefreshTableHeaderView egoRefreshScrollViewDidEndDragging:scrollView];
    [_loadMoreTableFooterView loadMoreScrollViewDidEndDragging:scrollView];
    if ([_backUpDelegate respondsToSelector:@selector(scrollViewDidEndDragging:willDecelerate:)]) {
        [_backUpDelegate scrollViewDidEndDragging:scrollView willDecelerate:decelerate];
    }
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ([_backUpDelegate respondsToSelector:@selector(tableView:heightForRowAtIndexPath:)]) {
        return  [_backUpDelegate tableView:tableView heightForRowAtIndexPath:indexPath];
    }
    return 0;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ([_backUpDelegate respondsToSelector:@selector(tableView:didSelectRowAtIndexPath:)]) {
        [_backUpDelegate tableView:tableView didSelectRowAtIndexPath:indexPath];
    }
}
#pragma -mark EGORefreshTableHeaderDelegate method
-(void)egoRefreshTableHeaderDidTriggerRefresh:(EGORefreshTableHeaderView *)view
{
    _isRefreshing = YES;
    [self.dataSource zTableView:self dataSourceRefreshCompletion:^(BOOL finished) {
        
        _isRefreshing = NO;
        [self reloadData];
        [_egoRefreshTableHeaderView egoRefreshScrollViewDataSourceDidFinishedLoading:self];
    }];
}

-(BOOL)egoRefreshTableHeaderDataSourceIsLoading:(EGORefreshTableHeaderView *)view
{
    return _isRefreshing;
}
-(NSDate*)egoRefreshTableHeaderDataSourceLastUpdated:(EGORefreshTableHeaderView *)view
{
    return [NSDate date];
}
#pragma -mark LoadMoreTableFooterDelegate method
-(void)loadMoreTableFooterDidTriggerLoadMore:(LoadMoreTableFooterView *)view
{
    _isLoading = YES;
    [self.dataSource zTableView:self dataSourceLoadMoreCompletion:^(BOOL finished) {
        _isLoading = NO;
        [self reloadData];
    }];
}
-(BOOL)loadMoreTableFooterDataSourceIsLoading:(LoadMoreTableFooterView *)view
{
    return _isLoading;
}
#pragma -mark 重写set方法
-(void)setUseSearchHeader:(BOOL)useSearchHeader
{
    if (_useSearchHeader == useSearchHeader)
    {
        _useSearchHeader = useSearchHeader;
        return;
    }
    _useSearchHeader = useSearchHeader;
    if (_useSearchHeader == YES)
    {
        [_searchBar release];
        _searchBar = nil;
        _searchBar = [[UISearchBar alloc] initWithFrame:CGRectMake(10, 0, self.frame.size.width-20, 44)];
        _searchBar.placeholder = @"60万款应用搜索看";
        //_searchBar.showsCancelButton = YES;
        _searchBar.searchBarStyle = UISearchBarStyleDefault;
        _searchBar.delegate = _searchBarDelegate;
        self.tableHeaderView = _searchBar;
        [self creatSearchDisplayController];
    }
    else
    {
        [_searchBar release];
        _searchBar = nil;
        [_searchDisplayController release];
        _searchDisplayController = nil;
        self.tableHeaderView = nil;
    }
}

-(void)setUseSearchDisplayController:(BOOL)useSearchDisplayController
{
    if (_useSearchDisplayController == useSearchDisplayController)
    {
        _useSearchDisplayController = useSearchDisplayController;
        return;
    }
    _useSearchDisplayController = useSearchDisplayController;
    if (_useSearchDisplayController == YES) {
        [self creatSearchDisplayController];
    }else
    {
        [_searchDisplayController release];
        _searchDisplayController = nil;
    }
}
#pragma -mark 设置searchBar的delegate
-(void)setSearchBarDelegate:(id<UISearchBarDelegate>)searchBarDelegate
{
    _searchBarDelegate = searchBarDelegate;
    if (_searchBar!=nil) {
        _searchBar.delegate = _searchBarDelegate;
    }
}
#pragma -mark 设置searchdisplayController的SearchResultsDataSource和SearchResultsDelegate
-(void)setSearchResultsDataSource:(id<UITableViewDataSource>)searchResultsDataSource
{
    _searchResultsDataSource = searchResultsDataSource;
    if (_searchDisplayController != nil) {
        _searchDisplayController.searchResultsDataSource = _searchResultsDataSource;
    }
}
-(void)setSearchResultsDelegate:(id<UITableViewDelegate>)searchResultsDelegate
{
    _searchResultsDelegate = searchResultsDelegate;
    if (_searchDisplayController != nil) {
        _searchDisplayController.searchResultsDelegate = _searchResultsDelegate;
    }
}
//设置searchDisplayController依附的controller
-(void)setSearchDisplaycontentsController:(UIViewController *)searchDisplaycontentsController
{
    if (searchDisplaycontentsController == nil) {
        [_searchDisplaycontentsController release];
        _searchDisplaycontentsController = nil;
        return;
    }
    [searchDisplaycontentsController retain];
    [_searchDisplaycontentsController release];
    _searchDisplaycontentsController = searchDisplaycontentsController;
    [self creatSearchDisplayController];
    
}
//创建searchDisplayController
-(void)creatSearchDisplayController
{
    if (_useSearchDisplayController == YES && _useSearchHeader == YES && _searchDisplaycontentsController != nil) {
        [_searchDisplayController release];
        _searchDisplayController = nil;
        _searchDisplayController = [[UISearchDisplayController alloc] initWithSearchBar:_searchBar contentsController:_searchDisplaycontentsController];
        _searchDisplayController.searchResultsDataSource = _searchResultsDataSource;
        _searchDisplayController.searchResultsDelegate = _searchResultsDelegate;
    }else
    {
        return;
    }
}
#pragma -mark 重写父类方法
-(void)reloadData
{
    [super reloadData];
    [_loadMoreTableFooterView loadMoreScrollViewDataSourceDidFinishedLoading:self];
}

@end
