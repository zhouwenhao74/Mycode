//
//  AppIconButtonModel.h
//  爱限免V5
//
//  Created by Alex on 14-5-25.
//  Copyright (c) 2014年 Alex.Chou. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AppInformationModel.h"
@interface AppIconButtonModel : NSObject<NSCoding>
{
    NSString *_appIDStr;
    NSString *_iconUrlStr;
    NSString *_appNameStr;
}
@property(nonatomic,readwrite,copy)NSString *appIDStr;
@property(nonatomic,readwrite,copy)NSString *iconUrlStr;
@property(nonatomic,readwrite,copy)NSString *appNameStr;
-(id)initWithArray:(NSArray*)array;

@end
