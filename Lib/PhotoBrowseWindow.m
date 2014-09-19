//
//  PhotoBrowseWindow.m
//  爱限免V5
//
//  Created by Alex on 14-5-25.
//  Copyright (c) 2014年 Alex.Chou. All rights reserved.
//

#import "PhotoBrowseWindow.h"
#import "PhotoImageView.h"
#import "UIImageView+QFwebImageView.h"
static PhotoBrowseWindow *shareWindow;
@implementation PhotoBrowseWindow
+(PhotoBrowseWindow*)sharePhotoBrowseWindow
{
    if (shareWindow == nil)
    {
        shareWindow = [[[self class] alloc] initWithFrame:[UIScreen mainScreen].bounds];
    }
    return shareWindow;
}
-(void)dealloc
{
    shareWindow = nil;
    [_PhotoViewController release];
    _PhotoViewController = nil;
    [super dealloc];
}
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        shareWindow = self;
        self.backgroundColor = [UIColor blackColor];
        [UIApplication sharedApplication].statusBarHidden = NO;
        _PhotoViewController = [[PhotoViewController alloc] init];
        self.rootViewController = _PhotoViewController;
        _PhotoViewController.view.frame = self.bounds;
        
    }
    return self;
}


-(void)setImageArray:(NSArray*)imageArray withIndex:(NSUInteger)index
{
    [_PhotoViewController setImageArray:imageArray withIndex:index];
    
}
-(void)setImageUrlArray:(NSArray*)imageUrlArray withIndex:(NSUInteger)index
{

    [_PhotoViewController setImageUrlArray:imageUrlArray withIndex:index];
    
}

/*
 // Only override drawRect: if you perform custom drawing.
 // An empty implementation adversely affects performance during animation.
 - (void)drawRect:(CGRect)rect
 {
 // Drawing code
 }
 */

@end
