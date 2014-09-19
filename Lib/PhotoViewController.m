//
//  PhotoViewController.m
//  爱限免V5
//
//  Created by Alex on 14-5-25.
//  Copyright (c) 2014年 Alex.Chou. All rights reserved.
//

#import "PhotoViewController.h"
#import "UIImageView+QFwebImageView.h"
#import "PhotoBrowseWindow.h"
#import <AssetsLibrary/AssetsLibrary.h>

@interface PhotoViewController ()

@end

@implementation PhotoViewController
@synthesize scrollView = _scrollView;

-(void)dealloc
{
    [PhotoFootBar release];
    _photoFootBar = nil;
    
    [_imageArray release];
    _imageArray = nil;
    
    [_imageUrlArray release];
    _imageUrlArray = nil;
    
    [_imageViewArray release];
    _imageViewArray = nil;
    
    [PhotoHeadBar release];
    _photoHeadBar = nil;
    
    [_scrollView release];
    _scrollView = nil;
    [super dealloc];
}
- (id)init
{
    self = [super init];
    if (self) {
        _imageViewArray = [[NSMutableArray alloc] init];
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor blackColor];
    [self ui_Config];
    // Do any additional setup after loading the view.
}
-(void)ui_Config
{
    _scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 20, self.view.frame.size.width, self.view.frame.size.height-60)];
    _scrollView.backgroundColor = [UIColor blackColor];
    _scrollView.pagingEnabled = YES;
    _scrollView.delegate = self;
    [self.view  addSubview:_scrollView];
    _photoHeadBar = [[PhotoHeadBar alloc] initWithFrame:CGRectMake(0,20, [UIScreen mainScreen].bounds.size.width, 40)];
    _photoHeadBar.photoHeadBarDelegate = self;
    [self.view addSubview:_photoHeadBar];
    
    _photoFootBar = [[PhotoFootBar alloc] initWithFrame:CGRectMake(0,[UIScreen mainScreen].bounds.size.height-40, [UIScreen mainScreen].bounds.size.width, 40)];
    _photoFootBar.photoFootBarDelegate = self;
    [self.view addSubview:_photoFootBar];
}
-(void)setImageArray:(NSArray*)imageArray withIndex:(NSUInteger)index
{
    
    if (imageArray == nil) {
        [_imageArray release];
        _imageArray = nil;
    }
    [imageArray retain];
    [_imageArray release];
    _imageArray = imageArray;
    _pageCount = _imageArray.count;
    _scrollView.contentSize = CGSizeMake(_scrollView.bounds.size.width*_pageCount, _scrollView.bounds.size.height);
    [self setHeadLabelText:index];
    
    
    for (UIView *view in _scrollView.subviews)
    {
        [view removeFromSuperview];
    }
    
    for (int i = 0; i<_pageCount; i++)
    {
        PhotoImageView *imageView = [[PhotoImageView alloc] initWithFrame:CGRectMake(5+_scrollView.frame.size.width*i, 0, _scrollView.frame.size.width-10, _scrollView.frame.size.height)];
        imageView.contentMode = UIViewContentModeScaleAspectFit;
        imageView.image = _imageArray[i];
        imageView.image = [[UIImage alloc] initWithCGImage:imageView.image.CGImage scale:1 orientation:UIImageOrientationUp];
        [_imageViewArray  addObject:imageView];
        [_scrollView addSubview:imageView];
        [imageView release];
    }
    
}
-(void)setImageUrlArray:(NSArray*)imageUrlArray withIndex:(NSUInteger)index
{
    if (imageUrlArray == nil) {
        [_imageUrlArray release];
        _imageUrlArray = nil;
    }
    [imageUrlArray retain];
    [_imageUrlArray release];
    _imageUrlArray = imageUrlArray;
    _pageCount = _imageUrlArray.count;
    _scrollView.contentSize = CGSizeMake(_scrollView.bounds.size.width*_pageCount, _scrollView.bounds.size.height);
    
    
    [self setHeadLabelText:index];
    
    for (UIView *view in _scrollView.subviews)
    {
        [view removeFromSuperview];
    }
    for (int i = 0; i<_pageCount; i++)
    {
        PhotoImageView *imageView = [[PhotoImageView alloc] initWithFrame:CGRectMake(5+_scrollView.frame.size.width*i, 0, _scrollView.frame.size.width-10, _scrollView.frame.size.height)];
        imageView.contentMode = UIViewContentModeScaleAspectFit;
        [imageView setImageWithUrlString:_imageUrlArray[i]];
        [_imageViewArray addObject:imageView];
        [_scrollView addSubview:imageView];
        [imageView release];
    }
}
#pragma -mark 按钮事件函数
-(void)goLeft
{
    NSUInteger nextPage = _currentPage-1;
    [self setCurrentPage:nextPage];
    
}
-(void)goRight
{
    NSUInteger nextPage = _currentPage+1;
    [self setCurrentPage:nextPage];
}
-(void)activePhoto
{
    UIActionSheet *actionSheet = [[UIActionSheet alloc] initWithTitle:nil delegate:self cancelButtonTitle:@"cancle" destructiveButtonTitle:nil otherButtonTitles:@"copy",@"save", nil];
    
    actionSheet.frame = CGRectMake(10, 100, 50, 100);
    [actionSheet showInView:self.view];
    [actionSheet release];
    
    
}
-(void)doneBtClick
{
    PhotoBrowseWindow *photoBrowseWindow = [PhotoBrowseWindow sharePhotoBrowseWindow];
    [UIView animateWithDuration:0.6 animations:^{
        photoBrowseWindow.layer.transform = CATransform3DScale( photoBrowseWindow.layer.transform, 0.0001, 0.0001, 1);
    } completion:^(BOOL finished) {

    }];
    
    
}
#pragma -mark 设置状态栏为白色；
-(UIStatusBarStyle)preferredStatusBarStyle{
    return UIStatusBarStyleLightContent;
}

-(void)setHeadLabelText:(NSUInteger)currentPage
{
    _currentPage = currentPage;
    _scrollView.contentOffset = CGPointMake(_scrollView.frame.size.width*(_currentPage-1), 0);
}
-(void)setCurrentPage:(NSUInteger)currentPage
{
    _currentPage = currentPage;
    [UIView animateWithDuration:0.3 animations:^{
        _scrollView.contentOffset = CGPointMake(_scrollView.frame.size.width*(_currentPage-1), 0);
    } completion:^(BOOL finished) {
        
    }];
}
#pragma -mark UIScrollViewDelegate Method
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    NSUInteger currentPage = scrollView.contentOffset.x/scrollView.frame.size.width+1;
    _currentPage = currentPage;
    _photoHeadBar.headLabel.text = [NSString stringWithFormat:@"%d of %d",_currentPage,_pageCount];
    if (_currentPage == 1) {
        _photoFootBar.goLeftButton.enabled = NO;
        return;
    }else if(_currentPage == _pageCount)
    {
        _photoFootBar.goRightButton.enabled = NO;
        return;
    }else
    {
        _photoFootBar.goLeftButton.enabled = YES;
        _photoFootBar.goRightButton.enabled = YES;
    }
    
}
#pragma -mark UIActionSheetDelegate Method
- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    //保存相片到系统
    if (buttonIndex == 1 ) {
        [actionSheet dismissWithClickedButtonIndex:buttonIndex animated:YES];
        PhotoImageView *imgView = _imageViewArray[_currentPage-1];
        UIActivityIndicatorView *activityView = [[UIActivityIndicatorView alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
        activityView.activityIndicatorViewStyle =UIActivityIndicatorViewStyleWhiteLarge;
        activityView.center = CGPointMake([UIScreen mainScreen].bounds.size.width/2, [UIScreen mainScreen].bounds.size.height/2);
        [activityView startAnimating];
        [self.view addSubview:activityView];
        ALAssetsLibrary *assetsLibrary = [[ALAssetsLibrary alloc] init];
        [assetsLibrary writeImageToSavedPhotosAlbum:[imgView.image CGImage] orientation:ALAssetOrientationUp completionBlock:^(NSURL *assetURL, NSError *error) {
            [activityView stopAnimating];
            [activityView removeFromSuperview];
            [activityView release];
            
            if (error == nil) {
                UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:nil message:@"保存成功" delegate:nil cancelButtonTitle:@"取消" otherButtonTitles: nil];
                [alertView show];
                [alertView release];
            }else
            {
                UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:nil message:@"保存失败" delegate:nil cancelButtonTitle:@"取消" otherButtonTitles: nil];
                [alertView show];
                [alertView release];
                
            }
            
            
        }];
    }
    if (buttonIndex == 0)
    {
        PhotoImageView *imgView = _imageViewArray[_currentPage-1];
        UIPasteboard *paseboard = [UIPasteboard generalPasteboard];
        paseboard.image = imgView.image;
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:nil message:@"复制成功" delegate:nil cancelButtonTitle:@"取消" otherButtonTitles: nil];
        [alertView show];
        [alertView release];
    }
    
}
#pragma -mark 内存警告
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end