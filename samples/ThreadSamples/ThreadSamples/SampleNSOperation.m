//
//  SampleNSOperation.m
//  ThreadSamples
//
//  Created by anjingxw@126.com on 16/6/3.
//  Copyright © 2016年 anjingxw. All rights reserved.
//

#import "SampleNSOperation.h"
//---NSOperationQueue相关
//[NSOperationQueue mainQueue] 主队列, 主线程
//[[NSOperationQueue alloc] init]  自定义队列，非主线程
//maxConcurrentOperationCount 属性来控制并发任务的数量，当设置为 1 时， 那么它就是一个串行队列

//使用NSOperation的方法
//方法一：NSInvocationOperation或者NSBlockOperation
//方法一：是继承NSOperation, 实现main方法或者start和main方法
/*
 start方法须知：
  start方法作用是通常是用来设置线程或者其他执行工作任务需要的运行环境的
 ·isExecuting 代表任务正在执行中
 ·isFinished 代表任务已经执行完成
 ·isCancelled 代表任务已经取消执行
 
 */

//队列里可以加入很多个NSOperation, 可以把NSOperationQueue看作一个线程池，可往线程池中添加操作（NSOperation）到队列中。线程池中的线程可看作消费者，从队列中取走操作，并执行它。


//
@interface MyOperation: NSOperation
@end

@implementation MyOperation

-(void)main{
    NSLog(@"MyOperation_main_%d", [NSThread isMainThread]);
}
@end

@implementation SampleNSOperation
-(void) test{
//    //方法一
//    NSInvocationOperation *operation = [[NSInvocationOperation alloc] initWithTarget:self selector:@selector(run) object:nil];
//    [operation start]; //开始执行任务(同步执行)
//    
//    
//    [[[NSOperationQueue alloc] init] addOperation:[[NSInvocationOperation alloc] initWithTarget:self selector:@selector(run) object:nil]];
//    
//    [[[NSOperationQueue alloc] init] addOperation:[NSBlockOperation blockOperationWithBlock:^{
//        NSLog(@"%d", [NSThread isMainThread]);
//    }]];
//    
//    [[NSOperationQueue mainQueue] addOperationWithBlock:^{
//         NSLog(@"%d", [NSThread isMainThread]);
//    }];
    
    //方法二
    [[[MyOperation alloc]init] start];
    
}

-(void)run{
}
@end
