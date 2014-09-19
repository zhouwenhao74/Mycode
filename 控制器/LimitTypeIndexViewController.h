//
//  LimitTypeIndexViewController.h
//  爱限免V5
//
//  Created by Alex on 14-5-25.
//  Copyright (c) 2014年 Alex.Chou. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LimitTypeIndexView.h"
@interface LimitTypeIndexViewController : UIViewController<UITableViewDataSource,UITableViewDelegate,UISearchBarDelegate>
{
    LimitTypeIndexView *_limitTypeIndexView;
    
}

@end
