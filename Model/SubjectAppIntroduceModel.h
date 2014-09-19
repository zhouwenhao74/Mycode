//
//  SubjectAppIntroduceModel.h
//  爱限免V5
//
//  Created by Alex on 14-5-25.
//  Copyright (c) 2014年 Alex.Chou. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SubjectAppIntroduceModel : NSObject
{
    NSString *_downLoads;
    NSString *_iconUrl;
    NSString *_name;
    float _starOverall;
    //评论的个数
    NSString *_comment;
    NSString *_appIDStr;
}
@property(nonatomic,readwrite,copy) NSString *downLoads;
@property (nonatomic,readwrite,copy)NSString *appIDStr;
@property(nonatomic,readwrite,copy) NSString *iconUrl;
@property(nonatomic,readwrite,copy) NSString *name;
@property(nonatomic,readwrite,copy) NSString *comment;
@property(nonatomic,readwrite,assign)float starOverall;
@property(nonatomic,readwrite,assign) NSMutableDictionary *dictionary;
-(id)initWithDictionary:(NSMutableDictionary*)dictionary;
@end

