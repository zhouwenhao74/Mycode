//
//  QFHttpRequest.m
//  爱限免V5
//
//  Created by Alex on 14-5-25.
//  Copyright (c) 2014年 Alex.Chou. All rights reserved.
//
#import "QFHttpRequest.h"
#import "QFCachedDownloadManager.h"
static QFHttpRequest *g_curretRequest = nil;
typedef void (^FinishBlock) (NSData * data);
typedef void (^FailBlock) (NSError * error);
@interface QFHttpRequest ()
{
    NSMutableData *_data ;
    FinishBlock _finishBlock;
    FailBlock _failBlock;
}
@property (nonatomic,retain)NSMutableData *data;
@property (nonatomic,copy)FinishBlock finishBlock;
@property (nonatomic,copy)FailBlock failBlock;
-(void)startWithUrl:(NSURL*)url;
@end

@implementation QFHttpRequest
@synthesize data = _data;
@synthesize finishBlock = _finishBlock;
@synthesize failBlock = _failBlock;
- (void)dealloc
{
    [_data release];
    _data = nil;
    self.failBlock = nil;
    self.finishBlock = nil;
    [super dealloc];
}
+(QFHttpRequest*)getCurrentRequest
{
    return g_curretRequest;
}
+(void)requestWithUrlString:(NSString *)urlStr finish:(void (^)( NSData * data))finish  error:(void (^)(NSError *error))error
{
    NSString *str = [urlStr stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    NSURL *url = [NSURL URLWithString:str];
    
    [QFHttpRequest requestWithUrl:url finish:finish error:error];
    
}
+(void)requestWithUrl:(NSURL *)url finish:(void (^)( NSData* data))finish  error:(void (^)(NSError *error))error
{
    QFHttpRequest *request = [[QFHttpRequest alloc] init];
    if (g_curretRequest != nil) {
        [g_curretRequest release];
    }
    g_curretRequest = [request retain];
    
    request.finishBlock = finish;
    request.failBlock =  error;
    
    [request startWithUrl:url];
}

-(void)startWithUrl:(NSURL*)url
{
    
    NSMutableURLRequest *mutableURLRequest = [[[NSMutableURLRequest alloc] initWithURL:url] autorelease];
    [mutableURLRequest setTimeoutInterval:30];
    
    NSURLCache *urlCache = [NSURLCache sharedURLCache];
    NSCachedURLResponse *cachedURLreponse = [urlCache cachedResponseForRequest:mutableURLRequest];
    
    //本地有缓存
    if (cachedURLreponse!=nil)
    {
        //取出缓存的cache－control
        NSHTTPURLResponse *reponse = (NSHTTPURLResponse *) [cachedURLreponse response];
        
        NSString *cocheControl = [[reponse allHeaderFields] valueForKey:@"Cache-Control"];
        
        unsigned long long maxAge = [[cocheControl substringFromIndex:strlen("max-age=")] longLongValue];
        if (maxAge == 0) {
            maxAge = 24000;
        }
        
        QFCachedDownloadManager *qfCachedDownloadManager = [QFCachedDownloadManager shareQFCachedDownloadManager];
        
        time_t cacheTime = [qfCachedDownloadManager cacheTimeWithURLString:url.absoluteString];
        time_t nowTime = time(0);
        
        //缓存是否过期
        if (nowTime - cacheTime > maxAge) {
            //立刻发起异步请求
            NSURLRequest *request = [NSURLRequest requestWithURL:url cachePolicy:NSURLRequestReloadIgnoringCacheData timeoutInterval:30];
            [NSURLConnection connectionWithRequest:request delegate:self];
            
        }else//缓存没过期、直接同步调用代码块finishBlock
        {
            _finishBlock([cachedURLreponse data]);
        }
    }else//本地没有缓存立刻发起异步请求
    {
        //立刻发起异步请求
        
        NSURLRequest *request = [NSURLRequest requestWithURL:url cachePolicy:NSURLRequestReloadIgnoringCacheData timeoutInterval:30];
        [NSURLConnection connectionWithRequest:request delegate:self];
    }
    
}
#pragma -mark NSURLConnectionDataDelegate

//接收到数据包头
- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
{
    [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
    
}

//完成一次接收数据时候，会被多次调用
- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    [_data appendData:data];
}


//完成数据接收的时候
- (void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
    
    [[QFCachedDownloadManager shareQFCachedDownloadManager] setURLString: connection.currentRequest.URL.absoluteString cacheTime:time(0)];
    if(_stop == NO)
    {
        _finishBlock(_data);
    }
    
    [self release];
}
#pragma -mark NSURLConnectionDelegate
- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error
{
    [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
    _failBlock(error);
    [self release];
}
-(id) init
{
    self =  [super init];
    if (self != nil)
    {
        _data = [[NSMutableData alloc] init];
    }
    return self;
    
    
}
@end
