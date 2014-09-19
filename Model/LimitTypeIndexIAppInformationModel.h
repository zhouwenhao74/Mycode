//
//  LimitTypeIndexIAppInformationModel.h
//  爱限免V5
//
//  Created by Alex on 14-5-25.
//  Copyright (c) 2014年 Alex.Chou. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LimitTypeIndexIAppInformationModel : NSObject
{
    NSString *_appName;
    NSString *_gameType;
    NSString *_leftOfImageViewImageUrl;
    NSString *_leavingTime;
    NSString *_appPrice;
    float _starCount;
    NSUInteger _shareTimes;
    NSUInteger _saveTimes;
    NSUInteger _loadTimes;
    NSString *_appIDStr;
}
@property(nonatomic,readwrite,copy)NSString *leftOfImageViewImageUrl;
@property(nonatomic,readwrite,copy)NSString *appIDStr;
@property(nonatomic,readwrite,copy)NSString *appName;
@property(nonatomic,readwrite,copy)NSString *gameType;
@property(nonatomic,readwrite,copy)NSString *leavingTime;
@property(nonatomic,readwrite,copy)NSString *appPrice;
@property(nonatomic,readwrite,assign)float starCount;
@property(nonatomic,readwrite,assign)NSUInteger shareTimes;
@property(nonatomic,readwrite,assign)NSUInteger saveTimes;
@property(nonatomic,readwrite,assign)NSUInteger loadTimes;
-(id)initWithDictionary:(NSDictionary *)dictionary;
@end

