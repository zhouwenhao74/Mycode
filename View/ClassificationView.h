//
//  ClassificationView.h
//  爱限免V5
//
//  Created by Alex on 14-5-25.
//  Copyright (c) 2014年 Alex.Chou. All rights reserved.
//

#import <UIKit/UIKit.h>
@interface ClassificationView : UIView
{
    UITableView *_tableView;
}
@property (nonatomic,readonly,assign)UITableView *tableView;
@end
