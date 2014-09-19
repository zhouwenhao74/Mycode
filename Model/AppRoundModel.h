//
//  AppRoundModel.h
//  爱限免V5
//
//  Created by Alex on 14-5-26.
//  Copyright (c) 2014年 Alex.Chou. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AppRoundModel : NSObject
@property(nonatomic,readwrite,retain) NSMutableArray *imageUrlArrayR;
@property(nonatomic,readwrite,retain) NSMutableArray *labelArrayR;
-(id)initWithDictionary:(NSDictionary *)dictionary;
@end
