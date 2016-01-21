#Objective-C





##类型

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

	//alloc分配内存 init初始化
	RPoint* rp1=[[RPoint alloc] init];
	//方法调用，发消息
	[rp1 print];

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