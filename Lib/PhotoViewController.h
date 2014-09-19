//
//  PhotoViewController.h
//  爱限免V5
//
//  Created by Alex on 14-5-25.
//  Copyright (c) 2014年 Alex.Chou. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PhotoHeadBar.h"
#import "PhotoFootBar.h"
#import "PhotoImageView.h"
@interface PhotoViewController : UIViewController<PhotoHeadBarDelegate,PhotoFootBarDelegate,UIScrollViewDelegate,UIActionSheetDelegate>
{
    
    NSMutableArray *_imageViewArray;
    UIScrollView *_scrollView;
    NSArray *_imageArray;
    NSArray *_imageUrlArray;
    PhotoHeadBar *_photoHeadBar;
    PhotoFootBar *_photoFootBar;
    int _currentPage;
    NSUInteger _pageCount;
}
@property(nonatomic,readonly,retain)UIScrollView *scrollView;
-(void)setImageArray:(NSArray*)imageArray withIndex:(NSUInteger)index;
-(void)setImageUrlArray:(NSArray*)imageUrlArray withIndex:(NSUInteger)index;
@end

