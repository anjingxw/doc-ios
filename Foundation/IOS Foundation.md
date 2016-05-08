## Cocoa 框架
创建Mac OS X和IOS程序的原生面向对象API， 是一组框架的集合。最重要的要数“Foundation”和“UIKit”
。
- Foundation 界面无关，其中包含了大量常用的API，是框架的基础。
- UIKit 基础的UI库
- CoreFoundation  Foundation的c++的版本

![](http://images.cnitblog.com/blog/62046/201408/011901266024074.jpg)

## Foundation 框架
### NSArray
### NSAutoreleasePool
自动内存管理
### NSBundle
Bundle程序会使用到的资源.这些资源包含了如图像,声音,编译好的代码,nib文件。这个类提供对bundle目录的代码和资源访问的帮助。
```
pathFor..., pathsFor, URLFor, URLsFor
```
### NSByteOrder
大小端系统定义，大小端转换
### NSCalender
日期的计算，前后差，长度，开始等等
### NSCharacterSet
Unicode兼容的字符集合
```
URL...  支持Web的URL
字符串是否包含
```
### NSCoder
对象编码和解码
### NSData
数据段，数据来源可以是文件，base64加密，Bytes，URL
### NSDate 
 (00:00:00 UTC on 1 January 2001).来算的秒数，比较，计算时间差
### NSDateFormatter
生成一个对象用于格式化时间
### NSDateIntervalFormatter 
时间区间格式化时间
### NSMassFormatter 
重量字符格式化
### NSLengthFormatter
数字字符格式化，π等
### NSEnergyFormatter
能量字符格式化，焦耳，卡路里
### NSPersonNameComponents
封装了一个人的名字的组件，可扩展，面向对象的方式。
### NSPersonNameComponentsFormatter
### NSDecimal
数字精度计算
### NSDecimalNumber
数字精度计算，货币
### NSDictionary
### NSEnumerator
一个虚类，实例化它可以枚举集合对象，数组或者字典等
```
allObjects
nextObject
```
### NSError
### NSException
### NSFileHandle
- 文件： read， write， seek
- socket， pipe， devices ，观察设备和异步处理数据

### NSFileManager
文件系统相关，创建目录，目录是否存在
### NSFormatter
### NSHashTable
### NSHTTPCookie
### NSHTTPCookieStorage
单例，所有HTTPCookie的存储管理单元，可以读取和写入cookeies.
### NSIndexPath
```
var length: Int { get } // 可以有多个node， node的个数
```
精确指定一个树结构某个节点的数据，你有一个四层的 NSarray ，每层下面都有好多个 NSArray。
构造一个NSIndexPath 1.3.4.2， 第一层的第三个节点之下的第四个节点的第二个节点的数据。
### NSIndexSet
NSArray里面是(one, two, three, four, five)，造了个 indexSet 的内容是 1,2,3,5
套到那另一个 上，就是 (one, two,three,five)。
### NSInvocation 
调度，类似perform和 block

```
- (void)viewDidLoad {
    [super viewDidLoad];
    SEL myMethod = @selector(myLog);
    //创建一个函数签名，这个签名可以是任意的,但需要注意，签名函数的参数数量要和调用的一致。
    NSMethodSignature * sig  = [NSNumber instanceMethodSignatureForSelector:@selector(init)];
    //通过签名初始化
    NSInvocation * invocatin = [NSInvocation invocationWithMethodSignature:sig];
    //设置target
    [invocatin setTarget:self];
    //设置selecteor
    [invocatin setSelector:myMethod];
    //消息调用
    [invocatin invoke];
     
}
-(void)myLog{
    NSLog(@"MyLog");
}
```

### NSJSONSerialization
Json对象和Foundation对象的相互转化
### NSKeyValueCoding 
KVC
### NSKeyValueObserving
KVO
### NSKeyedArchiver
### NSLocale
封装语言、文化信息、技术规范和标准
```
+ISOCountryCodes//所有的ISO定义的国家地区编码
+ISOCurrencyCodes//所有的ISO定义的货币编码
+ISOLanguageCodes//所有ISO定义的语言编码
```
### NSLock
多线程锁
### NSMapTable
不只是一个能放weak指针的 NSDictionary
### NSMethodSignature
记录了一个方法的参数和返回值
### NSNotification
封装的消息体
- name 名称
- object 消息体
- userInfo 参数

### NSNotificationQueue
NSNotificationCenter 的消息管理队列， enqueue，dequeue
### NSNull 
单例对象，在不能使用nil的地方赋值， null函数
### NSNumberFormatter
NSNumber 和NSString的相互转化
### NSObject
### NSOperation
NSOperation是一个抽象的基类，表示一个独立的计算单元，可以为子类提供有用且线程安全的建立状态，优先级，依赖和取消等操作。
### NSOrderedSet
有序的集合
### NSOrthography
用作拼写检查
### NSPathUtilities
NSString的类别，构成NSPath
### NSPointerArray
可以存储nil的NSMutableArray
### NSPointerFunctions
对指针函数的封装，可应用与NSArray，NSDirectory等。
### NSPort
NSPort是一个描述通信通道的抽象类。
### NSProcessInfo
进程信息
### NSPropertyList
属性列表
### NSProxy
所有NSObject的抽象类
- 创建方法， alloc， allocWithZone（类似自己一个独立的内存区域（内存池））
- dealloc， 析构方法
- 垃圾回收期当析构对象之前调用， finalize
- 未实现的方法处理
```
- (void)forwardInvocation:(NSInvocation *)anInvocation
– (NSMethodSignature *)methodSignatureForSelector:(SEL)aSelector
{
    return [realObject methodSignatureForSelector:aSelector];
}
```
- 判断是否有选择器存在
```
class func respondsToSelector(_ aSelector: Selector) -> Bool
```
### NSRange
location,length, 
### NSRegularExpression
正则表达式相关
### NSRunloop
对应win32的消息处理传递
```
while(running){
[NSRunLoop currentRunLoop] runMode:NSDefaultRunLoopMode beforeDate:[NSDate distantFuture]];
}
```
相当于 win下的
```
while (GetMessage(&msg, NULL, 0, 0)){
if (!TranslateAccelerator(msg.hwnd, hAccelTable, &msg)){
TranslateMessage(&msg);
DispatchMessage(&msg);}}
```
- run 执行run loop’s input sources and timers 一次
- runMode:beforeDate  在beforeDate前执行循环
- 计划和退出消息
```
func performSelector(_ aSelector: Selector,
              target target: AnyObject,
            argument arg: AnyObject?,
               order order: Int,
               modes modes: [String])
               //设置一个定时器，在下次运行循环开始执行target的aSelector
func cancelPerformSelector...
```
### NSScanner
NSScanner是一个类，用于在字符串中扫描指定的字符，尤其是把它们翻译/转换为数字和别的字符串。
### NSSet
### NSSortDescriptor
排序器
### NSStream 流
### NSString
### NSTextCheckingResult
字符串检查结果类， returned by the NSRegularExpression class and the NSDataDetector class 
### NSThread
### NSTimeZone
时区
### NSTimer 
定时器，制定一个fireDate，循环fire，一次fire
### NSURL
本地文件，远程资源文件， 编码数据的一块
### NSURLAuthenticationChallenge 
服务器对客户端鉴权的质问
### NSURLCache 
url缓存
###  NSURLConnection
负责发送请求，建立客户端和服务器的连接。发送NSURLRequest的数据给服务器，并收集来自服务器的响应数据
### NSURLCredential 
凭据，收到认证要求时，NSURLConnection 的委托对象会收到相应的消息并得到一个 NSURLAuthenticationChallenge 实例。该实例的发送方遵守 NSURLAuthenticationChallengeSender 协议。为了继续收到真实的数据，需要向该发送方向发回一个 NSURLCredential 实例。
### NSURLCredentialStorage
单例对象管理NSURLCredential
### NSURLError
### NSURLProtectionSpace
An NSURLProtectionSpace object represents a server or an area on a server, commonly referred to as a realm, that requires authentication.
### NSURLProtocol
当你注册自定义NSURLProtocol后，就有机会对所有的请求进行统一的处理，基于这一点它可以让你
- 自定义请求和响应
- 提供自定义的全局缓存支持
- 重定向网络请求
- 提供HTTP Mocking (方便前期测试)
- 其他一些全局的网络请求修改需求
### NSURLRequest
### NSURLResponse
### NSUserDefaults
NSUserDefaults对象是用来保存，恢复应用程序相关的偏好设置，配置数据等等.
单例，线程安全
### NSValue
It can hold any of the scalar types such as int, float, and char, as well as pointers, structures, and object id references.
### NSValueTransformer
虚类，转换对象
### NSXMLParser
xml解析
### NSZone
内存管理区域， alloc对应