//
//  SubjectModel.m
//  爱限免V5
//
//  Created by Alex on 14-5-25.
//  Copyright (c) 2014年 Alex.Chou. All rights reserved.
//

#import "SubjectModel.h"
#import "SubjectAppIntroduceModel.h"
@implementation SubjectModel
@synthesize appMutableArray = _appMutableArray;
@synthesize desc_imgUrlString = _desc_imgUrlString;
@synthesize imgUrl = _imgUrl;
@synthesize describe = _describe;
@synthesize title = _title;
@synthesize appIDStr = _appIDStr;
#pragma -mark 析构函数
-(void)dealloc
{
    self.appMutableArray = nil;
    self.desc_imgUrlString = nil;
    self.describe = nil;
    self.imgUrl = nil;
    self.title = nil;
    self.appIDStr = nil;
    [_dictionary release];
    _dictionary = nil;
    [super dealloc];
}

-(id)initWithDictionary:(NSDictionary*)dictionary
{
    self = [super init];
    if (self!= nil) {
        self.dictionary = dictionary;
    }
    return self;
}
-(void)setDictionary:(NSDictionary *)dictionary
{
    if (dictionary == nil) {
        [_dictionary release];
        _dictionary = nil;
        return;
    }
    NSMutableArray *mutableArray = [[NSMutableArray alloc] init];
    NSMutableArray *array = (NSMutableArray*)dictionary[@"applications"];
    for (int i = 0; i<array.count; i++) {
        SubjectAppIntroduceModel *sbModel = [[SubjectAppIntroduceModel alloc] initWithDictionary:array[i]];
        [mutableArray addObject:sbModel];
        [sbModel release];
    }
    self.appMutableArray = mutableArray;
    [mutableArray release];
    //    self.appIDStr = dictionary[@"applicationId"];
    self.desc_imgUrlString = dictionary[@"desc_img"];
    self.imgUrl = dictionary[@"img"];
    self.title = dictionary[@"title"];
    self.describe = (NSString*)dictionary[@"desc"];
}

@end

