//
//  AppIntroduceButton.m
//  爱限免V5
//
//  Created by Alex on 14-5-25.
//  Copyright (c) 2014年 Alex.Chou. All rights reserved.
//

#import "AppIntroduceButton.h"
#import "UIImageView+QFwebImageView.h"
#import "Header.h"
@implementation ImageWithNumberView
-(void)dealloc
{
    [_leftImageView release];
    _leftImageView = nil;
    
    [_numberLabel release];
    _numberLabel = nil;
    [super dealloc];
}
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        _leftImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, kSelfWidth/5, kSelfHeight)];
        [self addSubview:_leftImageView];
        
        _numberLabel = [[UILabel alloc] initWithFrame:CGRectMake(kSelfWidth/4, 0, kSelfWidth*3/4, kSelfHeight)];
        _numberLabel.font = [UIFont systemFontOfSize:10];
        [self addSubview:_numberLabel];
        
    }
    return self;
}
-(void)setNumber:(NSUInteger)number
{
    _numberLabel.text = [NSString stringWithFormat:@"%d",number];
}
-(void)setImageViewImage:(UIImage *)imageViewImage
{
    _leftImageView.image = imageViewImage;
}
#pragma -mark 布局函数
-(void)layoutSubviews
{
    _leftImageView.frame = CGRectMake(0, 0, kSelfWidth/5, kSelfHeight);
    _numberLabel.frame = CGRectMake(kSelfWidth/4, 0, kSelfWidth*3/4, kSelfHeight);
}
@end


@implementation AppIntroduceButton
-(void)dealloc
{
    [_leftImageView release];
    _leftImageView = nil;
    
    [_titleLabel release];
    _titleLabel = nil;
    
    [_commotImageWithNumberView release];
    _commotImageWithNumberView = nil;
    
    [_downLoadImageWithNumberView release];
    _downLoadImageWithNumberView = nil;
    
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
    
    self.model = nil;
    [super dealloc];
    
}
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self uiConfig];
    }
    return self;
}
#pragma -mark UI布局
-(void)uiConfig
{
    _leftImageView = [[UIImageView alloc] initWithFrame:CGRectMake(kSelfHeight/10, kSelfHeight/10, kSelfHeight*4/5, kSelfHeight*4/5)];
    [self addSubview:_leftImageView];
    
    _titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(kSelfHeight, 0,kSelfWidth-kSelfHeight, kSelfHeight/3)];
    _titleLabel.font = [UIFont systemFontOfSize:10];
    [self addSubview:_titleLabel];
    
    _commotImageWithNumberView = [[ImageWithNumberView alloc] initWithFrame:CGRectMake(kSelfHeight, kSelfHeight*2/5, kSelfHeight, kSelfHeight/4)];
    _commotImageWithNumberView.imageViewImage = [UIImage imageNamed:@"11.png"];
    [self addSubview:_commotImageWithNumberView];
    
    _downLoadImageWithNumberView = [[ImageWithNumberView alloc] initWithFrame:CGRectMake(4*kSelfHeight/2, kSelfHeight*2/5, kSelfHeight, kSelfHeight/4)];
    _downLoadImageWithNumberView.imageViewImage = [UIImage imageNamed:@"123.png"];
    [self addSubview:_downLoadImageWithNumberView];
    
    _star1ImageView = [[UIImageView alloc] initWithFrame:CGRectMake(kSelfHeight, kSelfHeight*2/3, 13, 13)];
    //_star1ImageView.backgroundColor = [UIColor blackColor];
    [self addSubview:_star1ImageView];
    
    _star2ImageView = [[UIImageView alloc] initWithFrame:CGRectMake(_star1ImageView.frame.origin.x + _star1ImageView.frame.size.width + 1, _star1ImageView.frame.origin.y, _star1ImageView.frame.size.width, _star1ImageView.frame.size.height)];
    [self addSubview:_star2ImageView];
    
    _star3ImageView = [[UIImageView alloc] initWithFrame:CGRectMake(_star2ImageView.frame.origin.x + _star2ImageView.frame.size.width + 1, _star1ImageView.frame.origin.y, _star1ImageView.frame.size.width, _star1ImageView.frame.size.height)];
    [self addSubview:_star3ImageView];
    
    _star4ImageView = [[UIImageView alloc] initWithFrame:CGRectMake(_star3ImageView.frame.origin.x + _star3ImageView.frame.size.width + 1, _star1ImageView.frame.origin.y, _star1ImageView.frame.size.width, _star1ImageView.frame.size.height)];
    [self addSubview:_star4ImageView];
    
    _star5ImageView = [[UIImageView alloc] initWithFrame:CGRectMake(_star4ImageView.frame.origin.x + _star4ImageView.frame.size.width + 1, _star1ImageView.frame.origin.y, _star1ImageView.frame.size.width, _star1ImageView.frame.size.height)];
    [self addSubview:_star5ImageView];
    
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

-(void)setModel:(SubjectAppIntroduceModel *)model
{
    if (model == nil) {
        [_model release];
        _model = nil;
        return;
    }
    [model retain];
    [_model release];
    _model = model;
    _titleLabel.text = _model.name;
    _commotImageWithNumberView.number = [_model.comment intValue];
    _downLoadImageWithNumberView.number = [_model.downLoads intValue];
    self.starCount = _model.starOverall;
    [_leftImageView setImageWithUrlString:_model.iconUrl];
}
@end
