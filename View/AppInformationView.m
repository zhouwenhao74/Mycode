//
//  AppInformationView.m
//  爱限免V5
//
//  Created by Alex on 14-5-25.
//  Copyright (c) 2014年 Alex.Chou. All rights reserved.
//

#import "AppInformationView.h"
#import "Header.h"
#import "UIImageView+QFwebImageView.h"
@implementation AppInformationView
@synthesize iconImageView = _iconImageView;
@synthesize nameLabel = _nameLabel;
@synthesize priceLabel = _priceLabel;
@synthesize fileSizeLabel = _fileSizeLabel;
@synthesize categoryNameAndStarLabel = _categoryNameAndStarLabel;
@synthesize shareButton = _shareButton;
@synthesize favoritesButton = _favoritesButton;
@synthesize downloadButton = _downloadButton;
@synthesize descriptionLabel = _descriptionLabel;
@synthesize imageViewArray = _imageViewArray;
@synthesize roundImageArray = _roundImageArray;
@synthesize roundLabelArray = _roundLabelArray;
#pragma -mark 析构 和 构造
-(void)dealloc
{
    [_roundImageArray release];
    _roundImageArray = nil;
    
    [_roundLabelArray release];
    _roundLabelArray = nil;
    
    [_iconImageView release];
    _iconImageView = nil;
    
    [_nameLabel release];
    _nameLabel = nil;
    
    [_priceLabel release];
    _priceLabel = nil;
    
    [_fileSizeLabel release];
    _fileSizeLabel = nil;
    
    [_categoryNameAndStarLabel release];
    _categoryNameAndStarLabel = nil;
    
    [_shareButton release];
    _shareButton = nil;
    
    [_favoritesButton release];
    _favoritesButton = nil;
    
    [_downloadButton release];
    _downloadButton = nil;
    
    [_descriptionLabel release];
    _descriptionLabel = nil;
    
    [_imageViewArray release];
    _imageViewArray = nil;
    
    //三个按钮的label析构
    [_shareLabel release];
    _shareLabel = nil;
    [_favoritesLabel release];
    _favoritesLabel = nil;
    [_downloadLabel release];
    _downloadLabel = nil;
    
    [_appInformationModel release];
    _appInformationModel = nil;
    [super dealloc];
    
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        [self ui_config];
    }
    return self;
}
- (void) ui_config
{
    UIImageView *topView = [[UIImageView alloc] initWithFrame:CGRectMake(9, 9*kScreenHeight/480, 300, 280*kScreenHeight/480)];
    topView.image = [UIImage imageNamed:@"大框.png"];
    topView.userInteractionEnabled = YES;
    [self addSubview:topView];
    
    _iconImageView = [[UIImageView alloc] initWithFrame:CGRectMake(12, 19*kScreenHeight/480, 64, 64*kScreenHeight/480)];
    [topView addSubview:_iconImageView];
    
    _nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(90, 9*kScreenHeight/480, 200,20*kScreenHeight/480)];
    _nameLabel.font = [UIFont systemFontOfSize:14];
    [topView addSubview:_nameLabel];
    
    _priceLabel = [[UILabel alloc] initWithFrame:CGRectMake(90, 30*kScreenHeight/480, 200,20*kScreenHeight/480)];
    _priceLabel.font = [UIFont systemFontOfSize:14];
    [topView addSubview:_priceLabel];
    
    _fileSizeLabel = [[UILabel alloc] initWithFrame:CGRectMake(90, 50*kScreenHeight/480, 200,20*kScreenHeight/480)];
    _fileSizeLabel.font = [UIFont systemFontOfSize:14];
    [topView addSubview:_fileSizeLabel];
    
    _categoryNameAndStarLabel  = [[UILabel alloc] initWithFrame:CGRectMake(90, 70*kScreenHeight/480, 200,20*kScreenHeight/480)];
    _categoryNameAndStarLabel.font = [UIFont systemFontOfSize:14];
    [topView addSubview:_categoryNameAndStarLabel];
#pragma -mark 布局 分享 按钮
    _shareButton = [[UIButton alloc] initWithFrame:CGRectMake(2, 95*kScreenHeight/480, 97, 35*kScreenHeight/480)];
    _shareButton.tag = 1;
    [_shareButton addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    _shareButton.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"6.应用详情_0.png"]];
    UIImageView *shareImageView = [[UIImageView alloc] initWithFrame:CGRectMake(30, 10, 15, 15)];
    shareImageView.image = [UIImage imageNamed:@"6.应用详情_12.png"];
    shareImageView.userInteractionEnabled = NO;
    [_shareButton addSubview:shareImageView];
    [shareImageView release];
    _shareLabel = [[UILabel alloc] initWithFrame:CGRectMake(50, 10, 50, 15)];
    _shareLabel.userInteractionEnabled = NO;
    _shareLabel.text = @"分享";
    _shareLabel.textColor = [UIColor whiteColor];
    [_shareButton addSubview:_shareLabel];
    [topView addSubview:_shareButton];
    
#pragma -mark 布局 收藏 按钮
    _favoritesButton = [[UIButton alloc] initWithFrame:CGRectMake(100, 95*kScreenHeight/480, 100, 35*kScreenHeight/480)];
    _favoritesButton.tag = 2;
    [_favoritesButton addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    _favoritesButton.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"6.应用详情_0.png"]];
    UIImageView *favoritesImageView = [[UIImageView alloc] initWithFrame:CGRectMake(30, 10, 15, 15)];
    favoritesImageView.userInteractionEnabled = NO;
    favoritesImageView.image = [UIImage imageNamed:@"6.应用详情_09.png"];
    [_favoritesButton addSubview:favoritesImageView];
    [favoritesImageView release];
    
    _favoritesLabel = [[UILabel alloc] initWithFrame:CGRectMake(50, 10, 50, 15)];
    _favoritesLabel.userInteractionEnabled = NO;
    _favoritesLabel.text = @"收藏";
    _favoritesLabel.textColor = [UIColor whiteColor];
    [_favoritesButton addSubview:_favoritesLabel];
    [topView addSubview:_favoritesButton];
    
#pragma -mark 布局 下载 按钮
    _downloadButton = [[UIButton alloc] initWithFrame:CGRectMake(201, 95*kScreenHeight/480, 96, 35*kScreenHeight/480)];
    _downloadButton.tag = 3;
    [_downloadButton addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    _downloadButton.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"6.应用详情_0.png"]];
    UIImageView *downloadImageView = [[UIImageView alloc] initWithFrame:CGRectMake(30, 10, 15, 15)];
    downloadImageView.userInteractionEnabled = NO;
    downloadImageView.image = [UIImage imageNamed:@"6.应用详情_15.png"];
    [_downloadButton addSubview:downloadImageView];
    [downloadImageView release];
    
    _downloadLabel = [[UILabel alloc] initWithFrame:CGRectMake(50, 10, 50, 15)];
    _downloadLabel.userInteractionEnabled = NO;
    _downloadLabel.text = @"下载";
    _downloadLabel.textColor = [UIColor whiteColor];
    [_downloadButton addSubview:_downloadLabel];
    [topView addSubview:_downloadButton];
    _imageViewArray = [[NSMutableArray alloc] init];
    _roundLabelArray = [[NSMutableArray alloc] init];
    _roundImageArray = [[NSMutableArray alloc] init];
#pragma -mark 创建手势和添加手势
    
    for (int i = 0; i < 5; i++) {
        UITapGestureRecognizer*tapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tap:)];
        UIImageView *imgView = [[UIImageView alloc] initWithFrame:CGRectMake(8+57*i, 132*kScreenHeight/480, 51, 80)];
        [topView addSubview:imgView];
        imgView.userInteractionEnabled = YES;
        imgView.tag = i+1;
        [imgView addGestureRecognizer:tapGestureRecognizer];
        [tapGestureRecognizer release];
        [_imageViewArray addObject:imgView];
        [imgView release];
    }
    
    _descriptionLabel = [[UILabel alloc] initWithFrame:CGRectMake(7, 210*kScreenHeight/480, 285, 60*kScreenHeight/480)];
    _descriptionLabel.numberOfLines = 0;
    _descriptionLabel.font = [UIFont systemFontOfSize:11];
    [topView addSubview:_descriptionLabel];
    [topView release];
    
    UIImageView *bottomView = [[UIImageView alloc] initWithFrame:CGRectMake(10, 290*kScreenHeight/480, 300, 75*kScreenHeight/480)];
    bottomView.image = [UIImage imageNamed:@"小框.png"];
    bottomView.userInteractionEnabled = YES;
    [self addSubview:bottomView];
    for (int i=0; i<5; i++)
    {
        UIImageView *roundImage = [[UIImageView alloc] initWithFrame:CGRectMake(14+i*57, 10, 40, 40)];
        //roundImage.backgroundColor = [UIColor redColor];
        roundImage.userInteractionEnabled = YES;
        roundImage.tag = i;
        [bottomView addSubview:roundImage];
        [_roundImageArray addObject:roundImage];
        UILabel* roundLabel = [[UILabel alloc] initWithFrame:CGRectMake(14+i*57, 54, 40, 10)];
        //roundLabel.backgroundColor = [UIColor redColor];
        roundLabel.font = [UIFont systemFontOfSize:9];
        roundLabel.textAlignment =NSTextAlignmentCenter;
        [bottomView addSubview:roundLabel];
        [_roundLabelArray addObject:roundLabel];
    }
    [bottomView release];
    
    
}
#pragma -mark 分享 收藏 下载 按钮触发事件
-(void)buttonClick:(UIButton*)sender
{
    [_appInformationViewDelegate doneButtonClick:sender];
}
#pragma -mark UITapGestureRecognizer 方法
-(void)tap:(UITapGestureRecognizer*)tapGestureRecognizer
{
    if([_appInformationViewDelegate respondsToSelector:@selector(showAIphotoWithFirstPage:)])
    {
        
        [_appInformationViewDelegate showAIphotoWithFirstPage:tapGestureRecognizer.view.tag];
    }
}
-(void)setAppInformationViewDelegate:(id<AppInformationViewDelegate>)appInformationViewDelegate
{
    _appInformationViewDelegate = appInformationViewDelegate;
}
#pragma -mark 改变三个按钮的状态
-(void)setShareButtonDone
{
    _shareButton.enabled = NO;
    _shareButton.backgroundColor = [UIColor greenColor];
}
-(void)setFavoritesButtonDone
{
    _favoritesButton.enabled = NO;
    _favoritesButton.backgroundColor = [UIColor greenColor];
    
}
-(void)setDownloadButtonDone
{
    _downloadButton.enabled = NO;
    _downloadButton.backgroundColor = [UIColor greenColor];
}
-(void)setAppInformationModel:(AppInformationModel *)appInformationModel
{
    if (appInformationModel == nil) {
        [_appInformationModel release];
        _appInformationModel = nil;
        return;
    }
    [appInformationModel retain];
    [_appInformationModel release];
    _appInformationModel = appInformationModel;
    [self.iconImageView setImageWithUrlString:_appInformationModel.iconUrlStr];
    self.nameLabel.text = _appInformationModel.appNameStr;
    
    if ([_appInformationModel.expireDatetimeDate timeIntervalSinceNow]>0)
    {
        self.priceLabel.text = [NSString stringWithFormat:@"原价: ¥%@ (限免中)",_appInformationModel.currentPriceStr];
    }
    self.fileSizeLabel.text = [NSString stringWithFormat:@"大小: %@MB",_appInformationModel.fileSizeStr];
    self.categoryNameAndStarLabel.text = [NSString stringWithFormat:@"类型: %@      评分: %@",_appInformationModel.categoryNameStr,_appInformationModel.starCurrentStr];
    NSUInteger count = self.imageViewArray.count <_appInformationModel.imageUrlArrayM.count ? self.imageViewArray.count : _appInformationModel.imageUrlArrayM.count;
    for (int i = 0; i<count; i++) {
        UIImageView *imgView =(UIImageView *)self.imageViewArray[i];
        [imgView setImageWithUrlString:_appInformationModel.imageUrlArrayM[i]];
    }
    self.descriptionLabel.text = [NSString stringWithFormat:@"游戏简介:%@",_appInformationModel.descriptionStr];
    
}

-(void)setAppRoundModel:(AppRoundModel *)appRoundModel
{
    if (appRoundModel == nil) {
        [_appRoundModel release];
        _appRoundModel = nil;
        return;
    }
    [appRoundModel retain];
    [_appRoundModel release];
    _appRoundModel = appRoundModel;
    for (int i = 0 ; i < 5; i++) {
        UIImageView *imgView =(UIImageView *)self.roundImageArray[i];
        [imgView setImageWithUrlString:_appRoundModel.imageUrlArrayR[i]];
    }

    for (int i = 0 ; i < 5; i++) {
        UILabel *label =(UILabel *)self.roundLabelArray[i];
        label.text = _appRoundModel.labelArrayR[i];
    }
}
@end

