//
//  AppFreeTableViewCell.m
//  爱限免V5
//
//  Created by Alex on 14-5-25.
//  Copyright (c) 2014年 Alex.Chou. All rights reserved.
//

#import "AppFreeTableViewCell.h"




@interface AppFreeTableViewCell ()
{
    UILabel *_appNameLabel;
    UILabel *_gameTypeLabel;
    UILabel *_leavingTimeLabel;
    UILabel *_appPriceLabel;
    UILabel *_shareTimesLabel;
    UILabel *_saveTimesLabel;
    UILabel *_loadTimesLabel;
    UILabel *_cellNumberLabel;
    
    UIImageView  *_star1ImageView;
    UIImageView  *_star2ImageView;
    UIImageView  *_star3ImageView;
    UIImageView  *_star4ImageView;
    UIImageView  *_star5ImageView;
}
@property(nonatomic,readonly)UIImageView *leftOfImageView;
@property(nonatomic,assign)NSString *appName;
@property(nonatomic,assign)NSString *gameType;
@property(nonatomic,assign)NSString *leavingTime;
@property(nonatomic,assign)NSString *appPrice;
@property(nonatomic,assign)float starCount;
@property(nonatomic,assign)NSUInteger shareTimes;
@property(nonatomic,assign)NSUInteger saveTimes;
@property(nonatomic,assign)NSUInteger loadTimes;
@end
@implementation AppFreeTableViewCell
#pragma -mark 析构函数 初始化函数
-(void)dealloc
{
    [_appNameLabel release];
    _appNameLabel = nil;
    
    [_leftOfImageView release];
    _leftOfImageView = nil;
    
    [_gameTypeLabel release];
    _gameTypeLabel =nil;
    
    [_leavingTimeLabel release];
    _leavingTimeLabel = nil;
    
    [_appPriceLabel release];
    _appNameLabel = nil;
    
    [_shareTimesLabel release];
    _shareTimesLabel = nil;
    
    [_saveTimesLabel release];
    _saveTimesLabel = nil;
    
    [_loadTimesLabel release];
    _loadTimesLabel = nil;
    
    [_cellNumberLabel release];
    _cellNumberLabel = nil;
    
    [_accessoryImgView release];
    _accessoryImgView = nil;
    
    [_star1ImageView release];
    _star1ImageView = nil;
    
    [_star2ImageView release];
    _star2ImageView = nil;
    
    [_star3ImageView release];
    _star3ImageView = nil;
    
    [_star4ImageView release];
    _star4ImageView = nil;
    
    [_star5ImageView release];
    _star5ImageView = nil;
    
    self.appName = nil;
    self.gameType = nil;
    self.leavingTime = nil;
    self.accessoryImg = nil;
    [super dealloc];
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self)
    {
        [self uiConfig];
    }
    return self;
}

-(void)setStarCount:(float)starCount
{
    _starCount = starCount;
    if (starCount >= 5)
    {
        _star1ImageView.image = [UIImage imageNamed:@"star_1.png"];
        _star2ImageView.image = [UIImage imageNamed:@"star_1.png"];
        _star3ImageView.image = [UIImage imageNamed:@"star_1.png"];
        _star4ImageView.image = [UIImage imageNamed:@"star_1.png"];
        _star5ImageView.image = [UIImage imageNamed:@"star_1.png"];
    }
    else if (starCount >= 4.5)
    {
        _star1ImageView.image = [UIImage imageNamed:@"star_1.png"];
        _star2ImageView.image = [UIImage imageNamed:@"star_1.png"];
        _star3ImageView.image = [UIImage imageNamed:@"star_1.png"];
        _star4ImageView.image = [UIImage imageNamed:@"star_1.png"];
        _star5ImageView.image = [UIImage imageNamed:@"star_0.5.png"];
    }
    else if (starCount >= 4)
    {
        _star1ImageView.image = [UIImage imageNamed:@"star_1.png"];
        _star2ImageView.image = [UIImage imageNamed:@"star_1.png"];
        _star3ImageView.image = [UIImage imageNamed:@"star_1.png"];
        _star4ImageView.image = [UIImage imageNamed:@"star_1.png"];
        _star5ImageView.image = [UIImage imageNamed:@"star_0.png"];
    }
    else if (starCount >= 3.5)
    {
        _star1ImageView.image = [UIImage imageNamed:@"star_1.png"];
        _star2ImageView.image = [UIImage imageNamed:@"star_1.png"];
        _star3ImageView.image = [UIImage imageNamed:@"star_1.png"];
        _star4ImageView.image = [UIImage imageNamed:@"star_0.5.png"];
        _star5ImageView.image = [UIImage imageNamed:@"star_0.png"];
    }
    else if (starCount >= 3)
    {
        _star1ImageView.image = [UIImage imageNamed:@"star_1.png"];
        _star2ImageView.image = [UIImage imageNamed:@"star_1.png"];
        _star3ImageView.image = [UIImage imageNamed:@"star_1.png"];
        _star4ImageView.image = [UIImage imageNamed:@"star_0.png"];
        _star5ImageView.image = [UIImage imageNamed:@"star_0.png"];
    }
    else if (starCount >= 2.5)
    {
        _star1ImageView.image = [UIImage imageNamed:@"star_1.png"];
        _star2ImageView.image = [UIImage imageNamed:@"star_1.png"];
        _star3ImageView.image = [UIImage imageNamed:@"star_0.5.png"];
        _star4ImageView.image = [UIImage imageNamed:@"star_0.png"];
        _star5ImageView.image = [UIImage imageNamed:@"star_0.png"];
    }
    else if (starCount >= 2)
    {
        _star1ImageView.image = [UIImage imageNamed:@"star_1.png"];
        _star2ImageView.image = [UIImage imageNamed:@"star_1.png"];
        _star3ImageView.image = [UIImage imageNamed:@"star_0.png"];
        _star4ImageView.image = [UIImage imageNamed:@"star_0.png"];
        _star5ImageView.image = [UIImage imageNamed:@"star_0.png"];
    }
    else if (starCount >= 1.5)
    {
        _star1ImageView.image = [UIImage imageNamed:@"star_1.png"];
        _star2ImageView.image = [UIImage imageNamed:@"star_0.5.png"];
        _star3ImageView.image = [UIImage imageNamed:@"star_0.png"];
        _star4ImageView.image = [UIImage imageNamed:@"star_0.png"];
        _star5ImageView.image = [UIImage imageNamed:@"star_0.png"];
    }
    else if (starCount >= 1)
    {
        _star1ImageView.image = [UIImage imageNamed:@"star_1.png"];
        _star2ImageView.image = [UIImage imageNamed:@"star_0.png"];
        _star3ImageView.image = [UIImage imageNamed:@"star_0.png"];
        _star4ImageView.image = [UIImage imageNamed:@"star_0.png"];
        _star5ImageView.image = [UIImage imageNamed:@"star_0.png"];
    }
    else if (starCount >= 0.5)
    {
        _star1ImageView.image = [UIImage imageNamed:@"star_0.5.png"];
        _star2ImageView.image = [UIImage imageNamed:@"star_0.png"];
        _star3ImageView.image = [UIImage imageNamed:@"star_0.png"];
        _star4ImageView.image = [UIImage imageNamed:@"star_0.png"];
        _star5ImageView.image = [UIImage imageNamed:@"star_0.png"];
    }
    else
    {
        _star1ImageView.image = [UIImage imageNamed:@"star_0.png"];
        _star2ImageView.image = [UIImage imageNamed:@"star_0.png"];
        _star3ImageView.image = [UIImage imageNamed:@"star_0.png"];
        _star4ImageView.image = [UIImage imageNamed:@"star_0.png"];
        _star5ImageView.image = [UIImage imageNamed:@"star_0.png"];
    }
    
}

#pragma -mark UI布局
-(void)uiConfig
{
    _leftOfImageView = [[UIImageView alloc] initWithFrame:CGRectMake(10, 10, 60, 60)];
    //_leftOfImageView.backgroundColor =[UIColor redColor];
    [self addSubview:_leftOfImageView];
    
    _shareTimesLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 73, 90, 20)];
    _shareTimesLabel.textAlignment = NSTextAlignmentCenter;
    _shareTimesLabel.font = [UIFont systemFontOfSize:13];
    _shareTimesLabel.textColor = [UIColor blackColor];
    _shareTimesLabel.backgroundColor = [UIColor clearColor];
    [self addSubview:_shareTimesLabel];
    
    _cellNumberLabel = [[UILabel alloc] initWithFrame:CGRectMake(_leftOfImageView.frame.origin.x + _leftOfImageView.frame.size.width + 5, _leftOfImageView.frame.origin.y, 20, 25)];
    _cellNumberLabel.textColor = [UIColor blackColor];
    _cellNumberLabel.font = [UIFont boldSystemFontOfSize:15];
    _cellNumberLabel.textAlignment = NSTextAlignmentCenter;
    _cellNumberLabel.backgroundColor = [UIColor clearColor];
    [self addSubview:_cellNumberLabel];
    
    _appNameLabel = [[UILabel alloc] initWithFrame:CGRectMake(_cellNumberLabel.frame.origin.x + _cellNumberLabel.frame.size.width + 5, _cellNumberLabel.frame.origin.y, 250, 25)];
    _appNameLabel.textColor = [UIColor blackColor];
    _appNameLabel.textAlignment = NSTextAlignmentLeft;
    _appNameLabel.font = [UIFont boldSystemFontOfSize:15];
    _appNameLabel.backgroundColor = [UIColor clearColor];
    [self addSubview:_appNameLabel];
    
    _leavingTimeLabel = [[UILabel alloc] initWithFrame:CGRectMake(_cellNumberLabel.frame.origin.x+10, _appNameLabel.frame.origin.y + 20, 120, 25)];
    _leavingTimeLabel.textColor = [UIColor blackColor];
    _leavingTimeLabel.textAlignment = NSTextAlignmentLeft;
    _leavingTimeLabel.font = [UIFont boldSystemFontOfSize:14];
    _leavingTimeLabel.backgroundColor = [UIColor clearColor];
    [self addSubview:_leavingTimeLabel];
    
    _appPriceLabel = [[UILabel alloc] initWithFrame:CGRectMake(_leavingTimeLabel.frame.origin.x + _leavingTimeLabel.frame.size.width + 5, _leavingTimeLabel.frame.origin.y, 50, _leavingTimeLabel.frame.size.height)];
    _appPriceLabel.textColor = [UIColor blackColor];
    _appPriceLabel.font = [UIFont boldSystemFontOfSize:14];

    _appPriceLabel.textAlignment = NSTextAlignmentCenter;
    _appPriceLabel.backgroundColor = [UIColor clearColor];
    UIView *lineView = [[UIView alloc] initWithFrame:CGRectMake(0, _appPriceLabel.frame.size.height/2, _appPriceLabel.frame.size.width, 1)];
    lineView.backgroundColor = [UIColor redColor];
    [_appPriceLabel addSubview:lineView];
    [lineView release];
    [self addSubview:_appPriceLabel];
    
    _gameTypeLabel = [[UILabel alloc] initWithFrame:CGRectMake(_leavingTimeLabel.frame.origin.x + _leavingTimeLabel.frame.size.width + 5, _leavingTimeLabel.frame.origin.y + _leavingTimeLabel.frame.size.height-5 , 300, 20)];
    _gameTypeLabel.textColor = [UIColor blackColor];
    _gameTypeLabel.textAlignment = NSTextAlignmentLeft;
    _gameTypeLabel.font = [UIFont systemFontOfSize:13];
    _gameTypeLabel.backgroundColor = [UIColor clearColor];
    [self addSubview:_gameTypeLabel];
    
    _saveTimesLabel = [[UILabel alloc] initWithFrame:CGRectMake(110, 73, 90, 20)];
    _saveTimesLabel.textColor = [UIColor blackColor];
    _saveTimesLabel.font = [UIFont systemFontOfSize:13];
    _saveTimesLabel.textAlignment = NSTextAlignmentLeft;
    _saveTimesLabel.backgroundColor = [UIColor clearColor];
    [self addSubview:_saveTimesLabel];
    
    _loadTimesLabel = [[UILabel alloc] initWithFrame:CGRectMake(190, 73, 90, 20)];
    _loadTimesLabel.textColor = [UIColor blackColor];
    _loadTimesLabel.font = [UIFont systemFontOfSize:13];
    _loadTimesLabel.textAlignment = NSTextAlignmentLeft;
    _loadTimesLabel.backgroundColor = [UIColor clearColor];
    [self addSubview:_loadTimesLabel];
    
    _accessoryImgView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"1.主页_11.png"]];
    _accessoryImgView.frame = CGRectMake(300, 0, 20, 100);
    _accessoryImgView.contentMode =  UIViewContentModeScaleAspectFit;
    _accessoryImgView.backgroundColor = [UIColor clearColor];
    [self addSubview:_accessoryImgView];
    self.backgroundColor = [UIColor whiteColor];
    
    
    _star1ImageView = [[UIImageView alloc] initWithFrame:CGRectMake(_leavingTimeLabel.frame.origin.x, _leavingTimeLabel.frame.origin.y + _leavingTimeLabel.frame.size.height, 15, 15)];
    [self addSubview:_star1ImageView];
    
    _star2ImageView = [[UIImageView alloc] initWithFrame:CGRectMake(_star1ImageView.frame.origin.x + _star1ImageView.frame.size.width + 5, _star1ImageView.frame.origin.y, _star1ImageView.frame.size.width, _star1ImageView.frame.size.height)];
    [self addSubview:_star2ImageView];
    
    _star3ImageView = [[UIImageView alloc] initWithFrame:CGRectMake(_star2ImageView.frame.origin.x + _star2ImageView.frame.size.width + 5, _star1ImageView.frame.origin.y, _star1ImageView.frame.size.width, _star1ImageView.frame.size.height)];
    [self addSubview:_star3ImageView];
    
    _star4ImageView = [[UIImageView alloc] initWithFrame:CGRectMake(_star3ImageView.frame.origin.x + _star3ImageView.frame.size.width + 5, _star1ImageView.frame.origin.y, _star1ImageView.frame.size.width, _star1ImageView.frame.size.height)];
    [self addSubview:_star4ImageView];
    
    _star5ImageView = [[UIImageView alloc] initWithFrame:CGRectMake(_star4ImageView.frame.origin.x + _star4ImageView.frame.size.width + 5, _star1ImageView.frame.origin.y, _star1ImageView.frame.size.width, _star1ImageView.frame.size.height)];
    [self addSubview:_star5ImageView];
}

#pragma -mark 设置应用编号
-(void)setCellNumber:(NSUInteger)number
{
    _cellNumberLabel.text = [NSString stringWithFormat:@"%d",number];
}
#pragma -mark 重写属性的set方法
-(void)setAccessoryImg:(UIImage *)accessoryImg
{
    if (accessoryImg == nil) {
        [_accessoryImg release];
        _accessoryImg = nil;
    }
    [accessoryImg retain];
    [_accessoryImg release];
    _accessoryImg = accessoryImg;
    _accessoryImgView.image = _accessoryImg;
    
}
-(void)setAppName:(NSString *)appName
{
    _appName = appName;
    _appNameLabel.text = _appName;
}
-(void)setGameType:(NSString *)gameType
{
    _gameType = gameType;
    _gameTypeLabel.text = _gameType;
}
-(void)setLeavingTime:(NSString*)leavingTime
{
    _leavingTime = leavingTime;
    _leavingTimeLabel.text = [NSString stringWithFormat:@"剩余：%@",_leavingTime];
}
-(void)setAppPrice:(NSString*)appPrice
{
    _appPrice = appPrice;
    _appPriceLabel.text = appPrice;
}

-(void)setShareTimes:(NSUInteger)shareTimes
{
    _shareTimes = shareTimes;
    _shareTimesLabel.text = [NSString stringWithFormat:@"分享:%d次",_shareTimes];
}
-(void)setSaveTimes:(NSUInteger)saveTimes
{
    _saveTimes = saveTimes;
    _saveTimesLabel.text = [NSString stringWithFormat:@"收藏:%d次",_shareTimes];
}
-(void)setLoadTimes:(NSUInteger)loadTimes
{
    _loadTimes = loadTimes;
    _loadTimesLabel.text = [NSString stringWithFormat:@"下载:%d次",_loadTimes];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}

-(void)setAppInformationModel:(LimitTypeIndexIAppInformationModel *)appInformationModel
{
    if (appInformationModel == nil) {
        _appInformationModel = nil;
        return;
    }
    _appInformationModel = appInformationModel;
    
    self.appName = _appInformationModel.appName;
    [_leftOfImageView setImageWithUrlString:_appInformationModel.leftOfImageViewImageUrl placeholderImage:[UIImage imageNamed:@"iapp.png"]];
    self.gameType = appInformationModel.gameType;
    self.appPrice = appInformationModel.appPrice;
    self.starCount = appInformationModel.starCount;
    self.shareTimes = appInformationModel.shareTimes;
    self.saveTimes = appInformationModel.saveTimes;
    self.loadTimes = appInformationModel.loadTimes;
    self.leavingTime = appInformationModel.leavingTime;
}
@end
