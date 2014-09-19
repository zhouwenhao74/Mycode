//
//  PhotoFootBar.h
//  爱限免V5
//
//  Created by Alex on 14-5-25.
//  Copyright (c) 2014年 Alex.Chou. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol PhotoFootBarDelegate <UIToolbarDelegate>
-(void)goLeft;
-(void)goRight;
@optional
-(void)activePhoto;

@end
@interface PhotoFootBar : UIToolbar
{
    UIButton *_goLeftButton;
    UIButton *_goRightButton;
    UIButton *_photoMethodButton;
}
@property(nonatomic,readonly,retain)UIButton *goLeftButton;
@property(nonatomic,readonly,retain)UIButton *goRightButton;
@property(nonatomic,readonly,retain) UIButton *photoMethodButton;
@property(nonatomic,readwrite,assign)id <PhotoFootBarDelegate>photoFootBarDelegate;
@end

