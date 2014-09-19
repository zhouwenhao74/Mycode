//
//  SubjectAppIntroduceModel.m
//  爱限免V5
//
//  Created by Alex on 14-5-25.
//  Copyright (c) 2014年 Alex.Chou. All rights reserved.
//

#import "SubjectAppIntroduceModel.h"

@implementation SubjectAppIntroduceModel
@synthesize appIDStr = _appIDStr;
@synthesize downLoads = _downLoads;
@synthesize iconUrl = _iconUrl;
@synthesize name = _name;
@synthesize starOverall = _starOverall;
@synthesize comment = _comment;
#pragma -mark 析构函数
-(void)dealloc
{
    self.downLoads = nil;
    self.iconUrl = nil;
    self.name = nil;
    self.comment = nil;
    [super dealloc];
}
-(id)initWithDictionary:(NSMutableDictionary*)dictionary
{
    self = [super init];
    if (self!=nil) {
        self.dictionary = dictionary;
    }
    return self;
}
-(void)setDictionary:(NSMutableDictionary *)dictionary
{
    if (dictionary == nil) {
        [_dictionary release];
        _dictionary = nil;
        return;
    }
    self.appIDStr = dictionary[@"applicationId"];
    self.downLoads = dictionary[@"downloads"];
    self.iconUrl = dictionary[@"iconUrl"];
    self.name = dictionary[@"name"];
    self.comment = dictionary[@"comment"];
    self.starOverall = [dictionary[@"starOverall"] floatValue];
}

@end

