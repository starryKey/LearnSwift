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





















