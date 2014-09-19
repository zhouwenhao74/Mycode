//
//  InstallView.h
//  爱限免V5
//
//  Created by Alex on 14-5-25.
//  Copyright (c) 2014年 Alex.Chou. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface InstallView : UIView<UITableViewDataSource>
{
    UITableView *_tableView;
    NSMutableArray *_imageArray;
    NSArray *_titleStrArray;
}
@property (nonatomic,readonly,retain)UITableView *tableView;

@end
