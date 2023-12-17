
#Objective-C [#](https://developer.apple.com/library/mac/documentation/Cocoa/Conceptual/ProgrammingWithObjectiveC/Introduction/Introduction.html#//apple_ref/doc/uid/TP40011210-CH1-SW1) [#](https://developer.apple.com/library/ios/navigation/)

##前言

iOS支持 Swift,Objective-C, C/C++

学语言时需要关注的:
+ compile-time VS run-time
+ stack VS heap(变量的位置)
+ programmer VS compiler/runtime/framework(谁会动你的代码)

开发方式：
+ Clang/GCC(命令行)

    //命令行编译(arc自动内存管理)
	clang -fobjc-arc HelloWOrld.m -o HelloWorld
	//执行
	./HelloWorld

+ XCode

扩展名:
+ .m
+ .h

编译过程：

LLVM(Low level virtual machine) 

c/c++/OC -> GCC/LLVM-GCC/LLVM-Clang ->x86-64 Machine Code



##语言基础

value type

+ 基础类型
+ struct 
+ enum

reference type

+ class
+ pointer
+ block

类型装饰

+ protocol
+ category
+ extension


###class

类的定义在.h文件中,实现在.m文件中

数据成员:

	//alloc分配内存 init初始化
	RPoint* rp1=[[RPoint alloc] init];
	//方法调用，发消息
	[rp1 print];

+ instance variable(实例变量)
 
    //类内访问
    NSString* _firstName;
	
	//内部访问时最好访问属性而不是实例变量,因为setter包含了内存管理
	self.firstName
	
	以下三种情况可以访问实例变量：
	+ init
	+ dealloc
	+ getter/setter	
	
	实例变量的生命周期：
	+  实例变量跟随对象存在堆上(方法中的临时值类型在栈上)
	+　值类型实例变量随对象实例释放而释放
	+  引用类型实例变量通过指针引用堆上的引用类型实例，ARC对引用计数管理
  
+ property

    //实例属性无类属性，可以模拟类属性
    //类外访问
    //编译器会为属性生成getter,setter和实例变量
	//可以指定和自定义getter setter
    @property NSString* firstName;
	//只读属性只生成getter
	@property (readonly) NSString* firstName;
	
	
+ Attribute(属性描述特性)

    @property (readonly) NSString* firstName;
	//多线程 原子性
	@property (atomic) NSString* firstName;
	//ARC环境  强引用 
	@property (strong) NSString* firstName;
	//ARC环境  弱引用(不做内存计数，解决循环引用引起的内存泄露)
	@property (weak) Employee * owner;
    //创建独立拷贝
    @property (copy) NSString* firstName;
    


###struct

    //不能有方法

	typedef struct{
		int x;
		int y;
	}SPoint;
	
	SPoint sp1;
	sp1.x=10;
	sp1.y=20;


##stack VS heap

stack

+ 存值类型
+ 无ARC负担，系统自动管理，以执行函数为单位
+ 编译时确定大小(参数+局部变量)
+ 函数执行时系统自动分配stack,函数执行完立即销毁
+ 函数间值拷贝
+ 局部性，大小有限制，会stack overflow


heap

+ 手动请求(alloc)
+ 由ARC机制自动释放
+ 函数间通过拷贝引用(指针)传递
+ 全局性，无大小限制，会内存泄露






##问题

+ 对象里的值类型位置？