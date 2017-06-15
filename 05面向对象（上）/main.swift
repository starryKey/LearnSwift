//
//  main.swift
//  05面向对象（上）
//
//  Created by Li_JinLin on 2017/6/15.
//  Copyright © 2017年 www.dahuatech.com. All rights reserved.
//

import Foundation


print("Hello, World!-->05面向对象（上）")

/********************************************五、面向对象（上）*************************************************/
//5.1面向对象概述
//面向过程 & 面向对象: 面向过程，是一种以时间为中心的编程思想，面向过程就是分析出解决问题的步骤，然后用函数把这些步骤一一实现，使用的时候一个一个调用即可。面向对象，则是把解决问题的事务分解成多个对象，而建立对象的目的也不是为了完成一个个小步骤，而是为了描述某个事物在解决整个问题的过程中所发生的行为。


//5.2类和结构体
//5.2.1 类 & 结构体 类是一种复杂的数据类型，它是将不同类型的数据和与这些数据的相关操作（方法）封装在一起的集合体，类具有更高的抽象性；结构体与类相似，是用于封装具有相同类型或不同类型的一系列数据，也叫做结构。在C++和OC中，结构体功能单一，很少使用。但是在swift中的结构体不仅可以定义成员变量，还可以定义成员方法，swift非常重视结构体的使用，并对结构体提供了非常强大的面向对象支持。
//语法格式
//class 类名
//{
//    //定义类的内容
//}
////结构体的语法格式
//struct 结构体名称
//{
//    //定义结构体的内容
//}
/*
    tip: swift中的类和结构体的名称都以大写字母开头。类的方法和属性使用小写字母开头。
 */
//01使用关键字class定义一个类
class Student {

    var name:String = "Tom"
    var number:Int = 123456
    var height:Int = 170
    func study(){
        print("学号:\(number)身高:\(height)的\(name)在学习")
    }
}

let student = Student()
student.name = "Jack"
student.number = 666666
student.height = 180
student.study()
print(student.name)

//02使用Xcode创建一个类
//Employee

//5.2.2类和结构体的实例
var stu = Student()
stu.name = "John"
//在类或结构体后面直接跟一对空括号（），通过这种方式所创建的类实例，其值均会被初始化为默认值。在swift中类是引用类型的，与值类型不同，引用类型在被赋予到一个变量、常量或者被传递到一个函数时，其值不会被拷贝，因此引用的是已存在的实例本身而不是拷贝
//结构体的实例及访问
//swift要求实例化一个结构体时，所有成员变量都必须有初始值，构造函数的意义就是用于初始化所有的成员变量，与OC不同的是，内存分配是系统帮我们做的。如果在定义结构体是，所包含的属性都有默认值。
struct Person
{
    var name:String = "Tim"
    var age = 24
}
let per = Person()
print("姓名：\(per.name)年龄\(per.age)")

struct Person2
{
    var name:String
    var age:Int
    //
    func run() {
        print("跑步")
    }
}
//如果结构体中的属性没有设置默认值，那么必须使用结构体的构造函数来实例化结构体，所有结构体都有一个自动生成的逐一成员构造函数，
let person2 = Person2(name:"Jane",age:18)
print("姓名：\(person2.name)年龄\(person2.age)")
person2.run()

//在swift中，只有类类型是引用类型（引用类型在被赋予到一个变量、常量或者被传递到一个函数时，其值不会被拷贝，因此引用的是已存在的实例本身而不是拷贝），
//值类型：结构体、整数、浮点数 bool 字符串、数组、字典,所有结构体实例以及实例中所包含的任何值类型属性，在代码中传递的时候都会被复制
//例
struct StudentInfo
{
    var name:String
    var age:Int
    func showStudentInfo() -> Void {
        print("姓名：\(name),年龄:\(age)")
    }
}
//实例化结构体
var stu1 = StudentInfo(name:"maria",age:19)
var stu2 = stu1
stu1.showStudentInfo()
stu2.showStudentInfo()

stu1.name = "Jack"
stu1.showStudentInfo()
stu2.showStudentInfo()

/*
 tip  恒等运算符
 swift 提供两种恒等运算符=== （等价于）和 !==（不等价于）用来检测两个常量或者边来干是否引用同一个类实例
 */
class Person3: NSObject {
    
}
var per31 = Person3()
var per32 = Person3()
let per33 = per31
let per34 = per32
if (per33 == per31){
    print("引用同一个实例")
}
if(per33 !== per34){
    print("引用不同的实例")
}
//5.3.2 类和结构体对比
/*
 tips ：（1）、swift中类和结构体的共同点：
            1、定义属性用于存储值
            2、定义方法用于提供功能
            3、定义下标用于通过下标语法访问值
            4、定义构造函数用于生成初始化值
            5、通过拓展以增加默认实现的功能
            6、符合协议以对某类提供标准功能
        （2）、与结构体相比，类还有一些结构体不具备的特征
            1、继承允许一个类继承另一个类的特征
            2、类型转换在运行时检查和解释一个类实例的类型
            3、取消构造函数允许允许一个类实例四方任何其所分配的资源
            4、引用计数允许对一个类的多次引用
        （3）、结构体总是通过呗肤质的方式在代码中传递，因此请不要使用引用计数
 */

//5.3  属性
//属性用于描述特定类、结构或者枚举的值。在swift中属性可以分为存储属性、计算属性、和类属性三种。
//5.3.1存储属性（存储变量或者常量）
struct Teacher{
    let name = "Tom"
    var age = 28
    var home = "hanghzhou"
    
}
var tea1 = Teacher()
//tea1.name = "hh" error 注意name是常量
tea1.age = 29
tea1.home = "beijing"

var tea2 = Teacher() //此时实例是let常量实例，属性值不能被修改，与类不一样      原因 ： 值类型
//tea2.name = "zzz"error //注意name是常量
//tea2.age = 30
//tea2.home = "guangzhou"
print(tea2)

class Teacher2: NSObject {
    let name = "Liming"
    var age:Int = 30
}
let teac1 = Teacher2() //let 常量类型不能修改值,但是内部变量属性age可以修改，  原因 ： 引用类型
//tea2.name = "Xiaohua"
tea2.age = 40
let teac2 = Teacher2()
tea2.age = 40

//5.3.2懒存储属性
//swift提供了懒存储属性，懒存储属性是指当被第一次调用的时候才会计算器初始值的属性，一个懒存储属性通过在属性声明前面加上lazy来表识
//当属性初始值因为外部的原因，在实例初始化完成之前不能确定，或则会房属性初始值需要复杂、大量的计算时，就可以使用懒出场属性
//实例
class PersonInfo
{
    var personinfoFileName = "info.text"
}
class PersonDataManager {
    lazy var personInfo = PersonInfo()
    var data = String()
}
let manager = PersonDataManager()
manager.data += "some data"
manager.data += "some more data"
print(manager.data)
print(manager.personInfo.personinfoFileName)
//Objective-C的懒加载，其实就是调用成员属性的get方法，初始化值，而Swift的懒加载，是和Objective-C不同的
//在 Swift 中我们使用在变量属性前加 lazy 关键字的方式来简单地指定延时加载.我们在第一次访问某个属性时，判断这个属性背后的存储是否已经存在，如果存在则直接返回，如果不存在则说明是首次访问，那么就进行初始化并存储后再返回。这样我们可以把这个属性的初始化时刻推迟，与包含它的对象的初始化时刻分开，以达到提升性能的目的。
/*
    tip:必须将懒存储属性声明为变量（var），因为属性的值在实例构造完成之前可能无法得到它，而常量属性在构造过程完成之前必须要有初始值，因此无法声明称懒存储属性
 */
//5.3.3计算属性
//计算属性不存储值，而是提供了一个getter和setter来分别进行获取和设置其他属性的值。getter使用get关键字进行定义，setter使用set关键字进行定义
//例（如果计算属性的setter方法没有将被设置的值定义一个名称，会默认使用newValue名称代替）
class PersonA {
    var length:Int = 10
    var age:Int
    {
        get
        {
            return length * 2
        }
        set
        {
            length = newValue / 2
        }
    }
    //只读计算属性
    var height:Int
    {
        get
        {
            return length * 4
        }
    }
    //只读属性可以直接忽略get
    var height2:Int
    {
        return length * 4
    }
}
var personA = PersonA()
//personA.height = 10//只读属性不能赋值
personA.age = 20
print(personA.height)
/*
    tip: 计算属性必须使用var关键字定义，包括只读计算属性，因为它们的值时不固定的，let关键字只能用来声明存储的属性，表示初始化以后不呢个再被修改了
 */
//5.3.4 属性观察器
//属性观察器可以用来监控和响应初始化的属性值的变化，当属性的值发生改变的时候，以调用事先写好的代码额外执行一些操作并对此进行响应
//属性观察器包括didSet和willSet，其中属性值改变之前会触发willSet，之后会触发didSet。
/*
    tips：属性观察器的特点
    1、给属性添加观察器必须要知道属性的类型，否则编译失败
    2、willSet可以带一个newName的参数，没有的话，该参数默认命名为newValue
    3、didSet可以带一个oldName的参数，没有的话，该参数默认命名为oldValue
    4、属性初始化时，willSet 、didSet不会调用。只有在初始化上下文之外，当设置属性值时才会调用。另外，在didSet的实现体背给属性赋值，也不会再次调用属性的
    5、即使设置的值和原来的值相同，didSet和willSet也会被调用
 */
//例
class PersonB{

    //普通属性
    var name:String?
    var age:Int = 18
    {
        //在age属性发生变化之前
        willSet
        {
            print("将要设置的年龄的值为\(newValue)")
        }
        //在age属性发生变化之后，更新一下name属性
        didSet
        {
            if age < 16 {
                name = "Tom"
                print("\(age)岁的\(name!)")
            } else {
                name = "Jack"
                print(name ?? "John")
            }
            print("\(name!)的年龄从\(oldValue)改为了\(age)")
        }
    }
}
let perB = PersonB()
perB.age = 10
perB.age = 20
/*
    tip: 如果在didSet观察器里为属性赋值，这个值会替换观察器之前那设置的值
 */



















