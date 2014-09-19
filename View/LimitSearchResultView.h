//
//  LimitSearchResultView.h
//  爱限免V5
//
//  Created by Alex on 14-5-25.
//  Copyright (c) 2014年 Alex.Chou. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZTableview.h"
@interface LimitSearchResultView : UIView
{
    ZTableview *_ztableView;
    
}
@property (nonatomic,readonly,assign)ZTableview *ztableView;
@end
