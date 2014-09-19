//
//  FavoritesView.h
//  爱限免V5
//
//  Created by Alex on 14-5-25.
//  Copyright (c) 2014年 Alex.Chou. All rights reserved.
//

@class AppIconButton;
@protocol FavoritesViewDelegate <NSObject>

-(void)showAppInformationViewController:(AppIconButton*)appIconButton;

@end
#import <UIKit/UIKit.h>

@interface FavoritesView : UIView<UIScrollViewDelegate>
{
    NSArray *_valueArray;
    UIScrollView *_scrollView;
    NSMutableArray *_pageViewArray;
    UIPageControl *_pageControl;
}
@property(nonatomic,readwrite,assign) id <FavoritesViewDelegate>delegate;
@end
