//
//  AppInformationModel.h
//  爱限免V5
//
//  Created by Alex on 14-5-25.
//  Copyright (c) 2014年 Alex.Chou. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AppInformationModel : NSObject

@property(nonatomic,readwrite,copy) NSString *appIDStr;
@property(nonatomic,readwrite,copy) NSString *appNameStr;
@property(nonatomic,readwrite,copy) NSString *iconUrlStr;
@property(nonatomic,readwrite,copy) NSString *currentPriceStr;
@property(nonatomic,readwrite,retain) NSDate *expireDatetimeDate;
@property(nonatomic,readwrite,copy) NSString *fileSizeStr;
@property(nonatomic,readwrite,copy) NSString *starCurrentStr;
@property(nonatomic,readwrite,copy) NSString *categoryNameStr;
@property(nonatomic,readwrite,retain) NSMutableArray *imageUrlArrayM;
@property(nonatomic,readwrite,retain) NSMutableArray *originalImageUrlArrayM;
@property(nonatomic,readwrite,copy) NSString *descriptionStr;
-(id)initWithDictionary:(NSDictionary*)dictionary;


@end

