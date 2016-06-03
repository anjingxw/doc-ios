# Block是什么
函数对象和lambd的合体，但是block不仅实现函数的功能，还能携带函数的执行环境。
理解，包含如下：
- 函数对象(执行的代码),编译的时候确定。
- Block将使用到的或作用域附近到用到的变量的值建立一份快照拷贝到栈上。
- Block类似ObjC的对象，可以使用自动释放池管理内存。

# 基本语法
```
long (^sum) (int, int) = nil;// 声明一个Block变量,sum是个Block变量，该Block类型有两个int型参数，返回类型是long。
sum = ^ long (int a, int b) {// 定义Block并赋给变量sum
  return a + b;
};
long s = sum(1, 2); //调用Block：
typedef long (^BlkSum)(int, int); //typedef
```

# 内存中存储位置
- NSGlobalBlock:类似函数，位于text段
```
BlkSum blk1 = ^ long (int a, int b) {return a + b;};//没有参数
```
- NSStackBlock:位于栈内存，函数返回后Block将无效；
```
int base = 100;
BlkSum blk2 = ^ long (int a, int b) {return base + a + b;};//有参数传递(mrc下，arc下为NSMallocBlock)
```
- NSMallocBlock:位于堆内存
```
BlkSum blk3 = [[blk2 copy] autorelease];
```

# 使用说明
- blocks作为property的时候要使用copy
```
@property (nonatomic, copy) SomeBlockType someBlock;
```
- 防止
```
//no arc
__block BlockDemo *demo = [[BlockDemo alloc]init]; 
...
//arc 
- (IBAction)onTest:(id)sender  
{  
    BlockDemo *demo = [[BlockDemo alloc]init];  
    __weak typeof(BlockDemo) *weakDemo = demo; 
    [demo setExecuteFinished:^{  
        if (weakDemo.resultCode == 200) {  
            NSLog(@"call back ok.");  
        }  
    }];  
    [demo executeTest];  
}  
```

# Block的copy、retain、release操作
不同于NSObjec的copy、retain、release操作：
- Block_copy与copy等效，Block_release与release等效；
- 对Block不管是retain、copy、release都不会改变引用计数retainCount，retainCount始终是1；
- NSGlobalBlock：retain、copy、release操作都无效；
- NSStackBlock：retain、release操作无效，必须注意的是，NSStackBlock在函数返回后，Block内存将被回收。即使retain也没用。容易犯的错误是[[mutableAarry addObject:stackBlock]，在函数出栈后，从mutableAarry中取到的stackBlock已经被回收，变成了野指针。正确的做法是先将stackBlock copy到堆上，然后加入数组：[mutableAarry addObject:[-[stackBlock copy] autorelease]]。支持copy，copy之后生成新的NSMallocBlock类型对象。
- NSMallocBlock支持retain、release，虽然retainCount始终是1，但内存管理器中仍然会增加、减少计数。copy之后不会生成新的对象，只是增加了一次引用，类似retain；
尽量不要对Block使用retain操作。

# Block中使用的ObjC对象的行为
```
@property (nonatomic, copy) void(^myBlock)(void);

MyClass* obj = [[[MyClass alloc] init] autorelease];
self.myBlock = ^ {
  [obj doSomething];
};
//对象obj在Block被copy到堆上的时候自动retain了一次。
//因为Block不知道obj什么时候被释放，为了不在Block使用obj前被释放，Block retain了obj一次，在Block被释放的时候，obj被release一次.
//__block 修饰符屏蔽了上述过程。
```