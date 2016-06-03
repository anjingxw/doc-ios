//
//  SampleNSThread.m
//  ThreadSamples
//
//  Created by anjingxw@126.com on 16/6/1.
//  Copyright © 2016年 anjingxw. All rights reserved.
//

#import "SampleNSThread.h"

@implementation SampleNSThread

//创建线程
#pragma create

//--隐式创建并启动线程
-(void)implicitCreate{
    [self performSelectorInBackground:@selector(implicitRun:) withObject:@"arg"];
}
//--静态方法创建
-(void)staticCreate{
    [NSThread detachNewThreadSelector:@selector(implicitRun:) toTarget:self withObject:@"arg"];
}
//--init方法创建
-(void)initCreate{
    NSThread* thread = [[NSThread alloc]initWithTarget:self selector:@selector(implicitRun:) object:@"arg"];
    [thread setName:@"thead"];
    [thread setThreadPriority:0.9];//优先级从0到1 1最高
    [thread start];

}

#pragma 线程状态
// 线程启动
//- (void)start;

// 线程睡眠
//[NSThread sleepForTimeInterval:3] 睡眠描述
//[NSThread sleepUntilDate:(NSDate *)date]

// 线程退出
//+ (void)exit
//-(void)cancel:cancel方法，只是改变了线程的状态标识，并不能结束线程，所以我们要配合isCancelled方法进行使用。

# pragma 线程通信
//-- 和主线程通信
//  NSObject (NSThreadPerformAdditions)
//- (void)performSelectorOnMainThread:(SEL)aSelector withObject:(id)arg waitUntilDone:(BOOL)wait;

//-- 其他子线程通信
//- (void)performSelector:(SEL)aSelector onThread:(NSThread *)thr withObject:(nullable id)arg waitUntilDone:(BOOL)wait

-(void)implicitRun:(id)arg{
   
    //[NSThread exit];
    
    NSThread* thead = [NSThread currentThread];
    [thead cancel];
    [NSThread sleepUntilDate:[NSDate dateWithTimeIntervalSinceNow:3]];
    if ([thead isCancelled]) {
        [NSThread exit];
    }

    
    [NSThread sleepForTimeInterval:3];
    NSLog(@"implicit..........%s", __func__);
    
    
}
@end
