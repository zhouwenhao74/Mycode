//
//  AppInformationView.h
//  爱限免V5
//
//  Created by Alex on 14-5-25.
//  Copyright (c) 2014年 Alex.Chou. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppInformationModel.h"
#import "AppRoundModel.h"
@protocol AppInformationViewDelegate <NSObject>

-(void)showAIphotoWithFirstPage:(NSUInteger)firstpage;
-(void)doneButtonClick:(UIButton*)sender;
@end
@interface AppInformationView : UIView
{
    UIImageView *_iconImageView;
    UILabel *_nameLabel;
    UILabel *_priceLabel;
    UILabel *_fileSizeLabel;
    UILabel *_categoryNameAndStarLabel;
    UIButton *_shareButton;
    UIButton *_favoritesButton;
    UIButton *_downloadButton;
    UILabel *_descriptionLabel;
    NSMutableArray *_imageViewArray;
    NSMutableArray *_roundImageArray;
    NSMutableArray *_roundLabelArray;
    //三个按钮的label
    UILabel *_shareLabel;
    UILabel *_favoritesLabel;
    UILabel *_downloadLabel;
    
}
@property(nonatomic,readonly,assign) UIImageView *iconImageView;
@property(nonatomic,readonly,assign) UILabel *nameLabel;
@property(nonatomic,readonly,assign) UILabel *priceLabel;
@property(nonatomic,readonly,assign) UILabel *fileSizeLabel;
@property(nonatomic,readonly,assign) UILabel *categoryNameAndStarLabel;
@property(nonatomic,readonly,assign) UIButton *shareButton;
@property(nonatomic,readonly,assign) UIButton *favoritesButton;
@property(nonatomic,readonly,assign) UIButton *downloadButton;
@property(nonatomic,readonly,assign) UILabel *descriptionLabel;
@property(nonatomic,readonly,assign) NSMutableArray *imageViewArray;
@property(nonatomic,readonly,assign) NSMutableArray *roundImageArray;
@property(nonatomic,readonly,assign) NSMutableArray *roundLabelArray;
@property(nonatomic,readwrite,assign) id<AppInformationViewDelegate>appInformationViewDelegate;
@property(nonatomic,readwrite,retain)AppInformationModel *appInformationModel;
@property(nonatomic,readwrite,retain)AppRoundModel *appRoundModel;
-(void)setShareButtonDone;
-(void)setFavoritesButtonDone;
-(void)setDownloadButtonDone;

@end

