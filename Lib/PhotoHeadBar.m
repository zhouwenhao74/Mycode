//
//  PhotoHeadBar.m
//  爱限免V5
//
//  Created by Alex on 14-5-25.
//  Copyright (c) 2014年 Alex.Chou. All rights reserved.
//

#import "PhotoHeadBar.h"

@implementation PhotoHeadBar
@synthesize headLabel = _headLabel;
@synthesize doneButton = _doneButton;
@synthesize photoHeadBarDelegate = _photoHeadBarDelegate;
-(void)dealloc
{
    [_headLabel release];
    _headLabel = nil;
    
    [_doneButton release];
    _doneButton = nil;
    
    [super dealloc];
}
- (id)initWithFrame:(CGRect)frame
{
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
    self = [super initWithFrame:frame];
    if (self) {
        self.barStyle = UIBarStyleBlack;
        self.tintColor = [UIColor whiteColor];
        _headLabel = [[UILabel alloc] initWithFrame:CGRectMake(frame.size.width/2-50, 0, 100, 40)];
        _headLabel.textColor = [UIColor whiteColor];
        _headLabel.textAlignment = NSTextAlignmentCenter;
        _headLabel.text = @"1 of 5";
        _headLabel.font = [UIFont fontWithName:@"Helvetica Bold" size:20];
        [self addSubview:_headLabel];
        
        _doneButton= [[UIButton alloc] initWithFrame:CGRectMake(frame.size.width-50, 5, 40, 30)];
        [_doneButton setTitle:@"完成" forState:UIControlStateNormal];
        _doneButton.titleLabel.font = [UIFont systemFontOfSize:15];
        [_doneButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        _doneButton.layer.borderWidth = 1;
        _doneButton.layer.cornerRadius = 5;
        _doneButton.layer.borderColor = [UIColor grayColor].CGColor;
        if ([self.photoHeadBarDelegate respondsToSelector:@selector(doneBtClick)])
        {
            [_doneButton addTarget:self.photoHeadBarDelegate action:@selector(doneBtClick) forControlEvents:UIControlEventTouchUpInside];
        }
        [self addSubview:_doneButton];
        
        // Initialization code
    }
    return self;
}
-(void)setPhotoHeadBarDelegate:(id<PhotoHeadBarDelegate>)photoHeadBarDelegate
{
    _photoHeadBarDelegate = photoHeadBarDelegate;
    if ([self.photoHeadBarDelegate respondsToSelector:@selector(doneBtClick)])
    {
        [_doneButton addTarget:self.photoHeadBarDelegate action:@selector(doneBtClick) forControlEvents:UIControlEventTouchUpInside];
    }
}

@end
