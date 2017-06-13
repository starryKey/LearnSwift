//
//  main.swift
//  01 基本语法
//
//  Created by Li_JinLin on 2017/6/14.
//  Copyright © 2017年 www.dahuatech.com. All rights reserved.
//

import Foundation

print("Hello, World!")
/*****************************01常量和变量*********************************/
//01常量 
let a:Int = 10
let b = 10
let c:Int
c = 10
let e:Int, f:String,g = 10
print(a,b,c,g)
//变量
var x:Int =  20

var y:Int
y = 30
//(变量类型不能省略)
var m = 4
var t:Int = 9,h = 10,k:Int
print(x,y,m,t,h)
/*
 tips:
 1、swift对命名比较宽松，可以使用字符，下划线，中文，图像符号等，但是不能已数字开头；
 2、常量和变量的名称不能复用，不能使用swift内置的关键字
 3、变量的值在第一次赋值之后可以改变多次。
 4、swift区分大小写，大小写字母视为不同的字符
 5、常量和变量不能互转
 6、常量和变量都没有默认值，在使用之前必须先赋值，否则会编译失败
 */

/*
    多学一招 ： 按住option 再用鼠标点击常量可显示常量类型
 */

/**********************************02类推断和类型安全*****************************/

let ab = "test"    //String
let bb = 10        //Int
let cc = 5.5 + 2   //double
var aa = true      //bool
let ww = 10.5
let num1 = bb + Int(ww)
/*
 tips:1、在C和OC中，数据类型是可以自动转换的，但是在swift中不允许任何形式的数据类型自动转换，只能强制转换
      2、两个类型不同的变量或者常量都不允许直接计算
 */

/**********************************03输出变量和常量*******************************/
//输出的方式
//01直接输出
print("hello");print(5)
//02输出常量或者变量的值
var i = "string";let u = 10
print(i,u)
//03、将常量或者变量加入字符串中显示
let mm = "dahuatech"
print("www.\(mm).com")
//04、多种格式输出
let kk = "滨安路1199号"
let web = "www.dahuatech.com"
print("地址:\(kk),","网址：\(web)")




























