//
//  QFHttpRequest.h
//  爱限免V5
//
//  Created by Alex on 14-5-25.
//  Copyright (c) 2014年 Alex.Chou. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface QFHttpRequest : NSObject<NSURLConnectionDataDelegate,NSURLConnectionDelegate>

/**
 *  根据url字符串发起异步请求
 *
 *  @param urlStr url字符串
 *  @param finish 请求成功回调的代码块
 *  @param error  请求失败回调的代码块
 */
+(void)requestWithUrlString:(NSString *)urlStr finish:(void (^)( NSData* data))finish  error:(void (^)(NSError *error))error;
/**
 *  根据NSURL发起异步请求
 *
 *  @param url    请求的NSURL
 *  @param finish 请求成功回调的代码块
 *  @param error  请求失败回调的代码块
 */
+(void)requestWithUrl:(NSURL *)url finish:(void (^)( NSData *data))finish  error:(void (^)(NSError *error))error;
+(QFHttpRequest*)getCurrentRequest;
@property (nonatomic,assign)BOOL stop;

@end

