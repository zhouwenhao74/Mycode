//
//  DetailClassificationViewController.h
//  爱限免V5
//
//  Created by Alex on 14-5-25.
//  Copyright (c) 2014年 Alex.Chou. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DetailClassificationView.h"
#import "IAPP_NS_ENM .h"
@interface DetailClassificationViewController : UIViewController<UITableViewDelegate,UISearchBarDelegate,ZTableViewDataSource>
{
    NSString *_categoryIdStr;
    NSString *_navigationTitle;
    DetailClassificationView *_detailClassificationView;
    ClassificationType _classificationType;
    //存放显示数据
    NSMutableArray *_dataSourceArray;
}
-(id)initWithCategoryIdStr:(NSString*)categoryIdStr NavigationTitle:(NSString*)navigationTitle type:(ClassificationType)classificationType;

@end
