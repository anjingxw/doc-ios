//
//  SampleCondition.m
//  ThreadSamples
//
//  Created by anjingxw@126.com on 16/6/1.
//  Copyright © 2016年 anjingxw. All rights reserved.
//

#import "SampleCondition.h"

@interface SampleCondition ()

//

@property(nonatomic, strong) NSCondition *condition;
@property(nonatomic, strong) NSMutableArray *products;
@property(nonatomic, assign) uint32  productIndex;
@end

@implementation SampleCondition


- (void)conditionTest{
    self.condition = [[NSCondition alloc]init];
    self.products = [[NSMutableArray alloc]init];
    
    self.productIndex = 0;
    
    [self performSelectorInBackground:@selector(createConsumenr) withObject:nil];
    [self performSelectorInBackground:@selector(createConsumenr0) withObject:nil];
    [self performSelectorInBackground:@selector(createProducter) withObject:nil];
    [self performSelectorInBackground:@selector(createProducter) withObject:nil];

}

- (void)createConsumenr
{
    [self.condition lock];
    if ([self.products count] == 0) {
        NSLog(@"wait for products");
        [self.condition wait]; //
    }
    NSLog(@"comsume a product %d", [(NSNumber*)self.products[0] intValue]);
    [self.products removeObjectAtIndex:0];
    [self.condition unlock];
}

- (void)createConsumenr0
{
    [self.condition lock];
    if ([self.products count] == 0) {
        NSLog(@"wait for products");
        [self.condition wait]; //
    }
    NSLog(@"comsume0 a product %d", [(NSNumber*)self.products[0] intValue]);
    [self.products removeObjectAtIndex:0];
    [self.condition unlock];
}



- (void)createProducter
{
    //while (true) {
        [self.condition lock];
        [self.products addObject:[NSNumber numberWithUnsignedInt:++self.productIndex]];
        NSLog(@"produce a product");
        [self.condition signal];
        [self.condition unlock];
   // }

}
-(void) test{
    
}
@end
