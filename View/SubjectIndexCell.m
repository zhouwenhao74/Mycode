//
//  SubjectIndexCell.m
//  爱限免V5
//
//  Created by Alex on 14-5-25.
//  Copyright (c) 2014年 Alex.Chou. All rights reserved.
//

#import "SubjectIndexCell.h"
#import "Header.h"
@implementation SubjectIndexCell
@synthesize appIntroduceBtArray = _appIntroduceBtArray;
#pragma -mark 析构函数和构造函数
- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        [self uiConfig];
    }
    return self;
}
- (void)dealloc
{
    [_titleLabel release];
    _titleLabel = nil;
    
    [_bigImageView  release];
    _bigImageView = nil;
    
    [_appIntroduceBtArray release];
    _appIntroduceBtArray = nil;
    
    [_descImageView release];
    _descImageView = nil;
    
    [_describeLabel release];
    _describeLabel = nil;
    
    [super dealloc];
    
}
#pragma -mark 界面布局
-(void)uiConfig
{
    _titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(20*290/580, 0, 600*290/580, 60*290/580)];
    _titleLabel.textAlignment = NSTextAlignmentLeft;
    _titleLabel.backgroundColor = [UIColor clearColor];
    _titleLabel.textColor = [UIColor blackColor];
    [self addSubview:_titleLabel];
    
    _bigImageView = [[UIImageView alloc] initWithFrame:CGRectMake(30*290/580, 70*290/580, 245*290/580, 360*290/580)];
    _bigImageView.backgroundColor = [UIColor clearColor];
    [self addSubview:_bigImageView];
    
    _appIntroduceBtArray = [[NSMutableArray alloc] init];
    for (int i = 0; i< 4; i++) {
        AppIntroduceButton *bt = [[AppIntroduceButton alloc] initWithFrame:CGRectMake(280*290/580, 70*290/580+(90*290/580)*i, 330*290/580, 90*290/580)];
        [_appIntroduceBtArray addObject:bt];
        [self addSubview:bt];
        [bt release];
    }
    _descImageView = [[UIImageView alloc] initWithFrame:CGRectMake(33*290/580, 461*290/580, 86*290/580, 86*290/580)];
    [self addSubview:_descImageView];
    
    _describeLabel = [[UILabel alloc] initWithFrame:CGRectMake(144*290/580, 451*290/580, 480*290/580, 120*290/580)];
    _describeLabel.backgroundColor = [UIColor clearColor];
    _describeLabel.textColor = [UIColor blackColor];
    _describeLabel.font = [UIFont systemFontOfSize:12];
    _describeLabel.numberOfLines = 0;
    [self addSubview:_describeLabel];
    
    
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}
-(void)setModel:(SubjectModel *)model
{
    _titleLabel.text = model.title;
    [_bigImageView setImageWithUrlString:model.imgUrl];
    for (int i = 0; i<model.appMutableArray.count; i++) {
        AppIntroduceButton *bt = (AppIntroduceButton *)_appIntroduceBtArray[i];
        bt.model = model.appMutableArray[i];
    }
    [_descImageView setImageWithUrlString:model.desc_imgUrlString];
    _describeLabel.text = model.describe;
}
@end
