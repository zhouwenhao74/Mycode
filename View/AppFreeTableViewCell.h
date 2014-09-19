//
//  AppFreeTableViewCell.h
//  爱限免V5
//
//  Created by Alex on 14-5-25.
//  Copyright (c) 2014年 Alex.Chou. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LimitTypeIndexIAppInformationModel.h"
#import "UIImageView+QFwebImageView.h"

@interface AppFreeTableViewCell : UITableViewCell
{
    LimitTypeIndexIAppInformationModel *_appInformationModel;
    UIImageView *_accessoryImgView;
}

@property(nonatomic,readwrite,assign) LimitTypeIndexIAppInformationModel *appInformationModel;
@property(nonatomic,readwrite,retain) UIImage *accessoryImg;

-(void)setCellNumber:(NSUInteger)number;

@end