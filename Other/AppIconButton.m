//
//  AppIconButton.m
//  爱限免V5
//
//  Created by Alex on 14-5-25.
//  Copyright (c) 2014年 Alex.Chou. All rights reserved.
//

#import "AppIconButton.h"
#import "UIImageView+QFwebImageView.h"
@implementation AppIconButton
@synthesize iconImageView = _iconImageView;
@synthesize nameLabel = _nameLabel;
-(void)dealloc
{
    [_iconImageView release];
    _iconImageView = nil;
    [_nameLabel release];
    _nameLabel = nil;
    self.appIconButtonModel =  nil;
    [super dealloc];
}
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        _iconImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, frame.size.width, frame.size.width)];
        [self addSubview:_iconImageView];
        
        _nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(0,  frame.size.width+5,  frame.size.width, frame.size.height- frame.size.width-5)];
        _nameLabel.font = [UIFont systemFontOfSize:12];
        [self addSubview:_nameLabel];
        _nameLabel.textAlignment = NSTextAlignmentCenter;
    }
    return self;
}
-(void)setAppIconButtonModel:(AppIconButtonModel *)appIconButtonModel
{
    if (appIconButtonModel == nil) {
        [_appIconButtonModel release];
        _appIconButtonModel = nil;
        return;
    }
    [appIconButtonModel retain];
    [_appIconButtonModel release];
    _appIconButtonModel = appIconButtonModel;
    _nameLabel.text =  _appIconButtonModel.appNameStr;
    [_iconImageView setImageWithUrlString:_appIconButtonModel.iconUrlStr placeholderImage:nil];
    if (_nameLabel.text.length>4) {
        NSString *str = [_nameLabel.text substringWithRange:NSMakeRange(_nameLabel.text.length-1, 1)];
        NSRange range = NSMakeRange(0, 2);
        _nameLabel.text = [[_nameLabel.text substringWithRange:range] stringByAppendingString:@"..."];
        _nameLabel.text = [_nameLabel.text stringByAppendingString:str];
    }
}

@end