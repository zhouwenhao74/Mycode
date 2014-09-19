//
//  AppIconButton.h
//  爱限免V5
//
//  Created by Alex on 14-5-25.
//  Copyright (c) 2014年 Alex.Chou. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppIconButtonModel.h"

@interface AppIconButton : UIButton
{
    UIImageView *_iconImageView;
    UILabel *_nameLabel;
}
@property(nonatomic,readonly,retain)UIImageView *iconImageView;
@property(nonatomic,readonly,retain)UILabel *nameLabel;
@property(nonatomic,readwrite,retain)AppIconButtonModel *appIconButtonModel;
@end
