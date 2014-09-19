//
//  QFCachedDownloadManager.h
//  爱限免
//
//  Created by chen cheng on 14-6-13.
//  Copyright (c) 2014年 chen cheng. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface QFCachedDownloadManager : NSObject
{
    //记录缓存数据的字典
    NSMutableDictionary *_cacheDictionary;
    
    //缓存数据字典的路径
    NSString *_cacheDictionaryPath;
}

+ (QFCachedDownloadManager *)shareQFCachedDownloadManager;

- (void)setURLString:(NSString *)urlString cacheTime:(time_t)time;

- (time_t)cacheTimeWithURLString:(NSString *)urlString;

- (void)saveCacheDictionary;

@end
