//
//  PhotoHeadBar.h
//  爱限免V5
//
//  Created by Alex on 14-5-25.
//  Copyright (c) 2014年 Alex.Chou. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol  PhotoHeadBarDelegate <UIToolbarDelegate>
-(void)doneBtClick;
@end
@interface PhotoHeadBar : UIToolbar
{
    UILabel *_headLabel;
    UIButton *_doneButton;
    id _photoHeadBarDelegate;
}
@property(nonatomic,readonly,retain) UILabel *headLabel;
@property(nonatomic,readonly,retain)  UIButton *doneButton;
@property(nonatomic,readwrite,assign) id<PhotoHeadBarDelegate> photoHeadBarDelegate;
@end
