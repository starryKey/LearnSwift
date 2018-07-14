//
//  main.swift
//  09Swift的其他高级特性
//
//  Created by Li_JinLin on 2017/6/19.
//  Copyright © 2017年 Li_JinLin. All rights reserved.
//

import Foundation

print("Hello, World!-->Swift的其他高级特性")

/********************************************九、Swift的其他高级特性*************************************************/
//9.1泛型
//泛型的本质是参数化类型，也就是说所操作的数据类型被指定为一个参数，这种参数类型可以用在类型、函数和方法中
//9.1.1泛型函数
//泛型可以用于函数的参数、返回值等，使用了泛型的函数通常称为泛型函数。使用泛型函数可以避免多次书写重复代码，是一种很好的代码简化方式
//01普通函数实现
//例子
//使用普通函数实现Int类型数值的交换(inout 输入输出参数：//说明：一般参数仅仅是在函数内可以改变的，当这个函数执行完后变量就会被销毁，如果想要通过一个函数可以修改参数的值，并且让这些修改在函数调用结束后仍然存在，这时可以将这个参数定义为输入输出函数即可。定义一个输入输出函数时，只要在参数类型前面加上inout关键字即可)
func exchange(a:inout Int,b: inout Int){
    let temp = a
    a = b
    b = temp
}
var num1 = 100
var num2 = 200
print("交换之前num1 = \(num1), num2 = \(num2)")
exchange(a: &num1, b: &num2)
print("交换之后num1 = \(num1),num2 = \(num2)")
//问题：如果是交换两个字符串、double类型的值，函数的功能和实现都是相同的，唯一不同的是传入变量类型不同。重写会造成代码的冗余，泛型可以解决这个问题
//02泛型函数的使用
//格式
//func 函数名<占位类型名> (参数名1：占位类型名，参数名2：占位类型名，......)
//例子
func exchangeGeneyics<T>(a: inout T,b: inout T ){
    let temp = a
    a = b
    b = temp
}
//定义两个double类型的变量进行交换
var doubleA = 8.0
var doubleB = 90.00
//交换前
print("交换前 doubleA = \(doubleA), doubleB = \(doubleB)")
exchangeGeneyics(a: &doubleA, b: &doubleB)
//交换后
print("交换后 doubleA = \(doubleA), doubleB = \(doubleB)")
//交换两个String类型的变量
var str1 = "hello"
var str2 = "world"
print("交换前:str1 = \(str1),str2 = \(str2)")
exchangeGeneyics(a: &str1, b: &str2)         //两个传入的参数类型必须一致
print("交换后:str1 = \(str1),str2 = \(str2)")

//9.1.2泛型类型
//Swift不但允许定义泛型函数，而且还允许定义泛型类型。这些自定义泛型类型可以是类、结构体和枚举，能适用于任何类型。
//01、普通类型的栈（栈是一系列值的有序集合，是一种后进先出的单向线性数据结构）
struct IntStack{
    var items = [Int]()
    mutating func push(item:Int){
        items.append(item)
    }
    mutating func pop(item:Int)->Int{
        return items.removeLast()
    }
}
//02泛型类型的栈
//泛型类型的结构体格式
//struct 结构体名<占位类型名>{}
//例子
struct Stack<Element>{
    var items = [Element]()
    mutating func push(item:Element){
        items.append(item)
    }
    mutating func pop()->Element{
        return items.removeLast()
    }
}
//创建一个String类型的栈实例
var stackOfString = Stack<String>()
//向栈中添加元素
stackOfString.push(item: "A")
stackOfString.push(item: "B")
stackOfString.push(item: "C")
stackOfString.push(item: "D")
print(stackOfString)
//移除一个元素
let fromTheTop = stackOfString.pop()
print("fromTheTop的值是\(fromTheTop)")

//03扩展泛型栈
extension Stack{
    var topItem:Element?{//只读计算属性
        return items.isEmpty ? nil : items[items.count - 1]
    }
}
//访问扩展的新属性
if let topItem = stackOfString.topItem{
    print("栈顶的元素是\(topItem)")
}

//10.1.3 类型约束
//默认情况下，泛型函数和泛型类型可作用于任何类型，不过，有的时候需要对泛型函数和泛型类型中的类型做一些强制约束。例如，swift的Dictionary类型对字典的键类型做出了约束，需要键类型必须是可哈希的，而所有的swift基本类型默认都是可哈希的。类型约束可以指定一个类型参数必须继承自指定类，或符合一个特定的协议或协议组合。
//基本的类型约束作用于泛型函数时的语法为
//func 函数名<T:类名，U:协议名>（参数名称：1，参数名称2：U）{
//    泛型函数的函数体
//}
//普通类型约束
func findStringIndex(array:[String],valueToFind:String)->Int?{
    for (index,value) in array.enumerated() {
        if value == valueToFind {
            return index
        }
    }
    return nil
}
let strArr = ["Hangzhou","Beijing","Shanghai","Zhengzhou"]
if let foundIndex = findStringIndex(array: strArr, valueToFind: "Hangzhou"){
    print("Hangzhou 在数组中的位置是:\(foundIndex)")
}
//泛型类型约束
func findIndex<T:Equatable>(array:[T],valueFind:T)->Int?{//定义一个Equatable类型约束作为泛型类型参数定义的一部分
    for (index,value) in array.enumerated() {
        if value == valueFind {
            return index
        }
    }
    return nil
}
let doubleIndex =  findIndex(array: [0.1,9.3,6.18,9,68], valueFind: 6.18)
print("6.18在数组中的位置是:\(doubleIndex!)")
let stringIndex = findIndex(array: ["iOS","Swift","Java","PHP"], valueFind: "Swift")
print("Swift在数组中的位置是\(stringIndex!)")
//如果不使用Equatable会出错，原因在于不是所有的swift类型都可以用等式符（==）进行比较，因为创建一个自己的类或结构体时，swift不知道这个自定义的类或结构体“相等”的标准是什么。在swift标准库中定义了一个Equatable协议，该协议要求遵守者必须实现等式符（==），从而使得==对符合该协议的类型值进行比较。所有的swift标准类型都自动支持Equatable协议。

//9.1.4 关联类型
//在定义协议时，有时候会对协议遵守者的元素类型有要求，此时可以在协议内声明一个或多个关联类型。关联类型可以理解为协议的泛型类型。挂链类型提供了一个占位名（或者说别名），其代表的实际




































