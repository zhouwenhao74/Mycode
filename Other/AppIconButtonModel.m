//
//  AppIconButtonModel.m
//  爱限免V5
//
//  Created by Alex on 14-5-25.
//  Copyright (c) 2014年 Alex.Chou. All rights reserved.
//

#import "AppIconButtonModel.h"
#import "AppIconButtonModel.h"
#import "QFHttpRequest.h"
#import "CONST.h"
@implementation AppIconButtonModel
@synthesize appNameStr = _appNameStr;
@synthesize appIDStr = _appIDStr;
@synthesize iconUrlStr = _iconUrlStr;
- (void)dealloc
{
    self.appNameStr = nil;
    self.appIDStr = nil;
    self.iconUrlStr = nil;
    [super dealloc];
}
-(id)initWithArray:(NSArray*)array
{
    self = [super init];
    if (self)
    {
        if (array == nil) {
            return self;
        }
        self.appIDStr = (NSString*)array[0];
        self.iconUrlStr = (NSString*)array[1];
        self.appNameStr = (NSString*)array[2];
        
    }
    return self;
}
#pragma -mark  NSCoding 方法
- (void)encodeWithCoder:(NSCoder *)aCoder;
{
    [aCoder encodeObject:self.appIDStr forKey:@"IDStr"];
    [aCoder encodeObject:self.appNameStr forKey:@"appNameStr"];
    [aCoder encodeObject:self.iconUrlStr forKey:@"iconUrlStr"];
    
}
- (id)initWithCoder:(NSCoder *)aDecoder;
{
    self = [super init];
    if (self) {
        self.appIDStr = [aDecoder decodeObjectForKey:@"IDStr"];
        self.appNameStr = [aDecoder decodeObjectForKey:@"appNameStr"];
        self.iconUrlStr = [aDecoder decodeObjectForKey:@"iconUrlStr"];
        
    }
    return self;
}
@end
