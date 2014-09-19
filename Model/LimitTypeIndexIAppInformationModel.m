//
//  LimitTypeIndexIAppInformationModel.m
//  爱限免V5
//
//  Created by Alex on 14-5-25.
//  Copyright (c) 2014年 Alex.Chou. All rights reserved.
//

#import "LimitTypeIndexIAppInformationModel.h"

@implementation LimitTypeIndexIAppInformationModel
@synthesize appName = _appName;
@synthesize appIDStr = _appIDStr;
@synthesize leftOfImageViewImageUrl = _leftOfImageViewImageUrl;
@synthesize gameType = _gameType;
@synthesize leavingTime = _leavingTime;
@synthesize appPrice = _appPrice;
@synthesize starCount = _starCount;
@synthesize shareTimes = _shareTimes;
@synthesize loadTimes = _loadTimes;
- (void)dealloc
{
    self.appIDStr = nil;
    self.appName = nil;
    self.leftOfImageViewImageUrl = nil;
    self.gameType = nil;
    self.leavingTime = nil;
    self.appPrice = nil;
    [super dealloc];
}
-(id)initWithDictionary:(NSDictionary *)appDic
{
    self = [super init];
    if (self != nil ) {
        if (appDic[@"applicationId"]!= nil) {
            self.appIDStr = appDic[@"applicationId"];
        }
        
        if (appDic[@"name"]!=nil) {
            self.appName = (NSString*)appDic[@"name"];
        }
        if (appDic[@"iconUrl"]!=nil) {
            self.leftOfImageViewImageUrl = appDic[@"iconUrl"];
        }
        if ( appDic[@"categoryName"]!=nil) {
            self.gameType = appDic[@"categoryName"];
        }
        if ( appDic[@"lastPrice"]!=nil) {
            self.appPrice = appDic[@"lastPrice"];
        }
        if ( appDic[@"starCurrent"]!=nil) {
            self.starCount = [appDic[@"starCurrent"] floatValue];
        }
        if (appDic[@"shares"]!=nil) {
            self.shareTimes = [appDic[@"shares"] intValue];
        }
        if (appDic[@"favorites"]!= nil) {
            self.saveTimes = [appDic[@"favorites"] intValue];
        }
        if (appDic[@"downloads"]!=nil) {
            self.loadTimes = [appDic[@"downloads"] intValue];
        }
        if (appDic[@"expireDatetime"]!=nil) {
            NSDate *now=[NSDate date];
            NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
            //设定时间格式,这里可以设置成自己需要的格式
            [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss.s"];
            NSDate *date =[dateFormatter dateFromString:appDic[@"expireDatetime"]];
            self.leavingTime = [self timesBetweenDate:date date:now];
            [dateFormatter release];
        }
    }
    return self;
}
-(NSString*)timesBetweenDate:(NSDate*)date date:(NSDate*)nowDate
{
    NSTimeInterval times = [date timeIntervalSinceDate:nowDate];
    int time = (int)times;
    int hour = 0;
    int min = 0;
    int ss = 0;
    hour = time/(60*60);
    min = (time-(3600*hour))/60;
    ss = (time -(3600*hour)-(60*min))%60;
    NSString *str = [NSString stringWithFormat:@"%d:%d:%d",hour,min,ss];
    return str;
}

@end
