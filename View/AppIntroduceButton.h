//
//  AppIntroduceButton.h
//  爱限免V5
//
//  Created by Alex on 14-5-25.
//  Copyright (c) 2014年 Alex.Chou. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SubjectAppIntroduceModel.h"
#import "AppFreeTableViewCell.h"
@interface ImageWithNumberView : UIView
{
    UIImageView *_leftImageView;
    UILabel *_numberLabel;
}
@property(nonatomic,readwrite,assign)NSUInteger number;
@property(nonatomic,readwrite,assign)UIImage *imageViewImage;

@end
@interface AppIntroduceButton : UIControl
{
    UILabel *_titleLabel;
    ImageWithNumberView *_commotImageWithNumberView;
    ImageWithNumberView *_downLoadImageWithNumberView;
    UIImageView *_leftImageView;
    
    UIImageView  *_star1ImageView;
    UIImageView  *_star2ImageView;
    UIImageView  *_star3ImageView;
    UIImageView  *_star4ImageView;
    UIImageView  *_star5ImageView;
}
@property(nonatomic,assign)float starCount;
@property(nonatomic,readwrite,retain)SubjectAppIntroduceModel *model;
@end
