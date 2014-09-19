//
//  PhotoBrowseWindow.h
//  爱限免V5
//
//  Created by Alex on 14-5-25.
//  Copyright (c) 2014年 Alex.Chou. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PhotoViewController.h"
@interface PhotoBrowseWindow : UIWindow
{
    
    PhotoViewController *_PhotoViewController;
    
}
-(void)setImageArray:(NSArray*)imageArray withIndex:(NSUInteger)index;
-(void)setImageUrlArray:(NSArray*)imageUrlArray withIndex:(NSUInteger)index;
+(PhotoBrowseWindow*)sharePhotoBrowseWindow;
@end
