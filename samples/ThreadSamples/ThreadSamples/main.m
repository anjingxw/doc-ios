//
//  main.m
//  ThreadSamples
//
//  Created by anjingxw@126.com on 16/5/31.
//  Copyright © 2016年 anjingxw. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SampleNSThread.h"
#import "SampleCondition.h"
#import "SampleNSOperation.h"


int main(int argc, const char * argv[]) {
    @autoreleasepool {
//        SampleNSThread* sample = [[SampleNSThread alloc] init];
//        [sample initCreate];
//        [[[SampleCondition alloc]init] conditionTest];
        [[[SampleNSOperation alloc]init] test];
    }
    
    [NSThread sleepForTimeInterval:4];
    return 0;
}
