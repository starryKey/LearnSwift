//
//  main.swift
//  04函数闭包枚举
//
//  Created by Li_JinLin on 2017/6/15.
//  Copyright © 2017年 www.dahuatech.com. All rights reserved.
//

import Foundation

print("Hello, World!-->函数、闭包、枚举")

/********************************************四、函数、闭包、枚举*************************************************/
//4.1函数
//4.1.1函数的定义和调用
    //01函数格式
    //func 函数名(参数名1:参数类型，参数名2:参数类型2...)->返回值类型{
    //    函数体
    //    return 返回值
    //}
func sum(a:Int,b:Int)->Int{
    return a+b
}
let result = sum(a: 2, b: 6)
print(result)
//无参函数
func sayHello()->String{
    return "hello"
}
//无返回值
func noreturn(a:Int,b:Int){
    print("sum = ",a+b)
}
noreturn(a: 10, b: 6)
//多返回值
func count(a:Int,b:Int,c:Int)->(minus:Int,sum:Int,multiply:Int){
    var minus = 0,sum = 0,multiply = 0
    minus = a - b
    sum = a + c
    multiply = b * c
    return(minus,sum,multiply)
}
let xCount = count(a: 10, b: 2, c: 4)
print(xCount)


//4.2闭包
//4.3枚举

