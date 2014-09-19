//
//  SearchResultViewController.h
//  爱限免V5
//
//  Created by Alex on 14-5-25.
//  Copyright (c) 2014年 Alex.Chou. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LimitSearchResultView.h"
@interface SearchResultViewController : UIViewController<ZTableViewDataSource,UITableViewDelegate>
{
    LimitSearchResultView *_limitSearchResultView;
    //存放搜索数据
    NSMutableArray *_searchDataArray;
    NSString *_searchString;
}
-(id)initWithSearchString:(NSString*)searchString;
@end