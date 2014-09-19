//
//  UIImageView+QFwebImageView.m
//  爱限免V5
//
//  Created by Alex on 14-5-25.
//  Copyright (c) 2014年 Alex.Chou. All rights reserved.
//

#import "UIImageView+QFwebImageView.h"
#import "QFHttpRequest.h"
@implementation UIImageView (QFwebImageView)
-(void)setImageWithUrlString:(NSString*)urlString
{
    NSURL *url = [NSURL URLWithString:urlString];
    [self setImageWithUrl:url];
}
-(void)setImageWithUrl:(NSURL*)url
{
    UIActivityIndicatorView *activityIndicatorView = [[UIActivityIndicatorView alloc] initWithFrame:self.bounds];
    activityIndicatorView.backgroundColor = [UIColor grayColor];
    activityIndicatorView.activityIndicatorViewStyle = UIActivityIndicatorViewStyleWhite;
    [self addSubview:activityIndicatorView];
    [activityIndicatorView startAnimating];
    [QFHttpRequest requestWithUrl:url finish:^(NSData *data)
     {
         [activityIndicatorView removeFromSuperview];
         [activityIndicatorView release];
         
         if (data != nil) {
             self.image = [UIImage imageWithData:data];
         }
         
     } error:^(NSError *error)
     {
         [activityIndicatorView removeFromSuperview];
         [activityIndicatorView release];
         
         NSLog(@"网络加载图片失败");
     }];
}
-(void)setImageWithUrl:(NSURL*)url placeholderImage:(UIImage *)image
{
    UIActivityIndicatorView *activityIndicatorView = [[UIActivityIndicatorView alloc] initWithFrame:self.bounds];
    activityIndicatorView.backgroundColor = [UIColor grayColor];
    activityIndicatorView.activityIndicatorViewStyle = UIActivityIndicatorViewStyleWhite;
    if (image == nil)
    {
        [self addSubview:activityIndicatorView];
        [activityIndicatorView startAnimating];
    }
    else
    {
        self.image = image;
    }
    
    [QFHttpRequest requestWithUrl:url finish:^(NSData *data)
     {
         
         if (data != nil) {
             self.image = [UIImage imageWithData:data];
         }
         [activityIndicatorView removeFromSuperview];
         [activityIndicatorView release];
     } error:^(NSError *error)
     {
         if (image == nil) {
             [activityIndicatorView removeFromSuperview];
             [activityIndicatorView release];
             
         }
         NSLog(@"网络加载图片失败");
     }];
}
-(void)setImageWithUrlString:(NSString *)urlString placeholderImage:(UIImage *)image
{
    NSURL *url = [NSURL URLWithString:urlString];
    [self setImageWithUrl:url placeholderImage:image];
}

@end
