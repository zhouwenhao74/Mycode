//
//  UIImageView+QFwebImageView.h
//  爱限免V5
//
//  Created by Alex on 14-5-25.
//  Copyright (c) 2014年 Alex.Chou. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImageView (QFwebImageView)
-(void)setImageWithUrlString:(NSString*)urlString;
-(void)setImageWithUrl:(NSURL*)url;
-(void)setImageWithUrl:(NSURL*)url placeholderImage:(UIImage *)image;
-(void)setImageWithUrlString:(NSString *)urlString placeholderImage:(UIImage *)image;
@end
