//
//  PhotoFootBar.m
//  爱限免V5
//
//  Created by Alex on 14-5-25.
//  Copyright (c) 2014年 Alex.Chou. All rights reserved.
//

#import "PhotoFootBar.h"


@implementation PhotoFootBar
@synthesize goLeftButton = _goLeftButton;
@synthesize goRightButton = _goRightButton;
@synthesize photoMethodButton = _photoMethodButton;
-(void)dealloc
{
    [_goRightButton release];
    _goRightButton = nil;
    
    [_goLeftButton release];
    _goLeftButton = nil;
    
    [_photoMethodButton release];
    _photoMethodButton =  nil;
    
    [super dealloc];
}
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.tintColor = [UIColor whiteColor];
        self.barStyle = UIBarStyleBlack;
        
        _goLeftButton = [[UIButton alloc] initWithFrame:CGRectMake(frame.size.width/2-50, 10, 30, 20)];
        [_goLeftButton setImage:[UIImage imageNamed:@"leftBt.png"] forState:UIControlStateNormal];
        [_goLeftButton addTarget:self.photoFootBarDelegate action:@selector(goLeft) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:_goLeftButton];
        
        _goRightButton = [[UIButton alloc] initWithFrame:CGRectMake(frame.size.width/2+10, 10, 30, 20)];
        [_goRightButton setImage:[UIImage imageNamed:@"rightBt.png"] forState:UIControlStateNormal];
        [_goLeftButton addTarget:self.photoFootBarDelegate action:@selector(goRight) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:_goRightButton];
        
        _photoMethodButton= [[UIButton alloc] initWithFrame:CGRectMake(frame.size.width-50, 10, 30, 20)];
        [_photoMethodButton setImage:[UIImage imageNamed:@"return.png"] forState:UIControlStateNormal];
        if ([self.photoFootBarDelegate respondsToSelector:@selector(activePhoto)]) {
            [_photoMethodButton addTarget:self.photoFootBarDelegate action:@selector(goRight) forControlEvents:UIControlEventTouchUpInside];
        }
        
        [self addSubview:_photoMethodButton];
        
        
    }
    return self;
}
-(void)setPhotoFootBarDelegate:(id<PhotoFootBarDelegate>)photoFootBarDelegate
{
    _photoFootBarDelegate = photoFootBarDelegate;
    [_goLeftButton addTarget:_photoFootBarDelegate action:@selector(goLeft) forControlEvents:UIControlEventTouchUpInside];
    [_goRightButton addTarget:_photoFootBarDelegate action:@selector(goRight) forControlEvents:UIControlEventTouchUpInside];
    if ([_photoFootBarDelegate respondsToSelector:@selector(activePhoto)]) {
        [_photoMethodButton addTarget:_photoFootBarDelegate action:@selector(activePhoto) forControlEvents:UIControlEventTouchUpInside];
    }
}

@end
