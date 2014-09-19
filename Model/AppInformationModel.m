//
//  AppInformationModel.m
//  爱限免V5
//
//  Created by Alex on 14-5-25.
//  Copyright (c) 2014年 Alex.Chou. All rights reserved.
//

#import "AppInformationModel.h"

@implementation AppInformationModel
-(void)dealloc
{
    self.appIDStr = nil;
    self.appNameStr = nil;
    self.iconUrlStr = nil;
    self.currentPriceStr = nil;
    self.expireDatetimeDate = nil;
    self.fileSizeStr = nil;
    self.starCurrentStr = nil;
    self.categoryNameStr = nil;
    self.imageUrlArrayM = nil;
    self.originalImageUrlArrayM = nil;
    self.descriptionStr = nil;
    [super dealloc];
}
-(id)initWithDictionary:(NSDictionary*)dictionary;
{
    self = [super init];
    if (self != nil)
    {
        self.appIDStr = dictionary[@"applicationId"];
        self.appNameStr = dictionary[@"name"];
        self.iconUrlStr = dictionary[@"iconUrl"];
        self.currentPriceStr = dictionary[@"lastPrice"];
        NSDateFormatter *formate = [[NSDateFormatter alloc] init];
        formate.dateFormat = @"yyyy-MM-dd HH:mm:ss.S";
        self.expireDatetimeDate = [formate dateFromString:dictionary[@"expireDatetime"]];
        [formate release];
        
        self.fileSizeStr = dictionary[@"fileSize"];
        self.starCurrentStr = dictionary[@"starCurrent"];
        self.categoryNameStr = dictionary[@"categoryName"];
        NSArray *array = dictionary[@"photos"];
        NSMutableArray *originalImageUrlArrayM = [[NSMutableArray alloc] init];
        NSMutableArray *imageUrlArrayM = [[NSMutableArray alloc] init];
        for(int i = 0; i < array.count;i++)
        {
            [imageUrlArrayM addObject:array[i][@"smallUrl"]];
            [originalImageUrlArrayM addObject:array[i][@"originalUrl"]];
        }
        self.imageUrlArrayM = imageUrlArrayM;
        self.originalImageUrlArrayM = originalImageUrlArrayM;
        [imageUrlArrayM release];
        [originalImageUrlArrayM release];
        self.descriptionStr = (NSString*)dictionary[@"description"];
    }
    return self;
    
}
@end

