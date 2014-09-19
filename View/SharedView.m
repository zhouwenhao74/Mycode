//
//  SharedView.m
//  爱限免V5
//
//  Created by Alex on 14-5-25.
//  Copyright (c) 2014年 Alex.Chou. All rights reserved.
//

#import "SharedView.h"
#import "AppIconButton.h"

@implementation SharedView
-(void)dealloc
{
    [_valueArray release];
    _valueArray = nil;
    [super dealloc];
}
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        _pageViewArray = [[NSMutableArray alloc] init];
        self.backgroundColor = [UIColor whiteColor];
        [self ui_Config];
        
    }
    return self;
}
-(void)ui_Config
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    id shared = [defaults objectForKey:@"shared"];
    if (shared != nil)
    {
        NSDictionary *dic = (NSDictionary *)shared;
        [_valueArray release];
        _valueArray = nil;
        _valueArray = [[dic allValues] retain];
    }
    _scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(10, 10, 300, [UIScreen mainScreen].bounds.size.height-140)];
    _scrollView.showsHorizontalScrollIndicator = NO;
    [self addSubview:_scrollView];
    int l = _valueArray.count%12;
    int page;
    if (l>0) {
        page = _valueArray.count/12+1;
    }else
    {
        page = _valueArray.count/12;
    }
    _scrollView.contentSize  = CGSizeMake(page*_scrollView.frame.size.width, _scrollView.frame.size.height);
    _scrollView.pagingEnabled =  YES;
    _scrollView.delegate = self;
    for (int i = 0; i<page; i++) {
        UIImageView *imgView = [[UIImageView alloc] initWithFrame:CGRectMake(_scrollView.frame.size.width*i, 0, _scrollView.frame.size.width, _scrollView.frame.size.height)];
        imgView.image = [UIImage imageNamed:@"大框.png"];
        imgView.contentMode = UIViewContentModeScaleToFill;
        imgView.userInteractionEnabled = YES;
        [_scrollView addSubview:imgView];
        [_pageViewArray addObject:imgView];
        [imgView release];
        
    }
    _pageControl = [[UIPageControl alloc] initWithFrame:CGRectMake(0, 0, 100, 20)];
    _pageControl.center = CGPointMake(160, _scrollView.frame.origin.y+_scrollView.frame.size.height+10);
    [self addSubview:_pageControl];
    _pageControl.numberOfPages = page;
    _pageControl.currentPage = 0;
    _pageControl.currentPageIndicatorTintColor = [UIColor blueColor];
    _pageControl.pageIndicatorTintColor = [UIColor grayColor];
    [_pageControl addTarget:self action:@selector(pageControlValueChange:) forControlEvents:UIControlEventValueChanged];
    
    int row = 0,index = 0,pageIndex = 0;
    for (int i = 0; i< _valueArray.count;i++)
    {
        NSArray *array = _valueArray[i];
        AppIconButtonModel *appIconButtonModel = [[AppIconButtonModel alloc] initWithArray:array];
        AppIconButton *appIconButton = [[AppIconButton alloc] initWithFrame:CGRectMake(10+75*index,30+((_scrollView.frame.size.height-270)/2+70)*row, 55, 70)];
        appIconButton.appIconButtonModel = appIconButtonModel;
        UIImageView *imgView = (UIImageView*)_pageViewArray[pageIndex];
        [imgView addSubview:appIconButton];
        [appIconButton addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
        [appIconButton release];
        [appIconButtonModel release];
        index++;
        if (index>3)
        {
            index = 0;
            row ++;
        }
        if (row>2) {
            pageIndex ++;
            row = 0;
        }
        
    }
    
    
}
-(void)buttonClick:(AppIconButton*)appIconButton
{
    [_delegate showAppInformationViewController:appIconButton];
}
#pragma -mark UITableViewDelegate 和pageControlValueChange响应事件
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    _pageControl.currentPage = scrollView.contentOffset.x/scrollView.frame.size.width;
}
-(void)pageControlValueChange:(id)sender
{
    _scrollView.contentOffset = CGPointMake(_pageControl.currentPage*_scrollView.frame.size.width, 0);
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

