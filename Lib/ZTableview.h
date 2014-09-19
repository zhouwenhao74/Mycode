//
//  ZTableview.h
//  爱限免V5
//
//  Created by Alex on 14-5-25.
//  Copyright (c) 2014年 Alex.Chou. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EGORefreshTableHeaderView.h"
#import "LoadMoreTableFooterView.h"

@class ZTableview;
@protocol ZTableViewDataSource <NSObject,UITableViewDataSource>
@required

-(void)zTableView:(ZTableview *)zTableView dataSourceRefreshCompletion:(void (^)(BOOL finished)) completion;

-(void)zTableView:(ZTableview *)zTableView dataSourceLoadMoreCompletion:(void (^)(BOOL finished))completion;
@end

@interface ZTableview : UITableView<UITableViewDelegate,EGORefreshTableHeaderDelegate,LoadMoreTableFooterDelegate>
{
    EGORefreshTableHeaderView *_egoRefreshTableHeaderView;
    BOOL _isRefreshing;
    BOOL _useSearchHeader;
    BOOL _useSearchDisplayController;
    UISearchBar *_searchBar;
    LoadMoreTableFooterView *_loadMoreTableFooterView;
    BOOL _isLoading;
    id <UITableViewDelegate> _backUpDelegate;
    UISearchDisplayController *_searchDisplayController;
    UIViewController *_searchDisplaycontentsController;
    
}
@property (nonatomic,readwrite,assign) id <ZTableViewDataSource> dataSource;
@property (nonatomic,readonly,retain) UISearchBar *searchBar;
@property (nonatomic,readwrite,assign) BOOL useSearchHeader;
@property (nonatomic,readwrite,assign) BOOL useSearchDisplayController;
@property (nonatomic,readwrite,retain) UIViewController *searchDisplaycontentsController;
@property (nonatomic,readwrite,assign) id<UITableViewDelegate>searchResultsDelegate;
@property (nonatomic,readwrite,assign) id<UITableViewDataSource>searchResultsDataSource;
@property (nonatomic,readwrite,assign) id<UISearchBarDelegate>searchBarDelegate;
@property (nonatomic,readonly,retain)  UISearchDisplayController *searchDisplayController;

@end


