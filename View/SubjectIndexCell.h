//
//  SubjectIndexCell.h
//  爱限免V5
//
//  Created by Alex on 14-5-25.
//  Copyright (c) 2014年 Alex.Chou. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppIntroduceButton.h"
#import "SubjectModel.h"
@interface SubjectIndexCell : UITableViewCell
{
    UILabel *_titleLabel;
    UIImageView *_bigImageView;
    NSMutableArray *_appIntroduceBtArray;
    UIImageView *_descImageView;
    UILabel *_describeLabel;
}
@property(nonatomic,readonly,assign) NSMutableArray *appIntroduceBtArray;
@property(nonatomic,readwrite,assign) SubjectModel *model;

@end
