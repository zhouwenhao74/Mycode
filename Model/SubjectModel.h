//
//  SubjectModel.h
//  爱限免V5
//
//  Created by Alex on 14-5-25.
//  Copyright (c) 2014年 Alex.Chou. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SubjectModel : NSObject
{
    NSString *_appIDStr;
    NSMutableArray *_appMutableArray;
    NSString *_desc_imgUrlString;
    NSString *_imgUrl;
    NSString *_describe;
    NSString *_title;
}
@property (nonatomic,readwrite,retain)NSMutableArray *appMutableArray;
@property (nonatomic,readwrite,copy)NSString *appIDStr;
@property (nonatomic,readwrite,copy)NSString *desc_imgUrlString;
@property (nonatomic,readwrite,copy)NSString *imgUrl;
@property (nonatomic,readwrite,copy)NSString *describe;
@property (nonatomic,readwrite,copy)NSString *title;
@property (nonatomic,readwrite,assign)NSDictionary *dictionary;
-(id)initWithDictionary:(NSDictionary*)dictionary;
@end
