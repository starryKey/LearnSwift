//
//  main.swift
//  02控制流
//
//  Created by Li_JinLin on 2017/6/14.
//  Copyright © 2017年 Li_JinLin. All rights reserved.
//

/*
    swift中的下划线作用：1、格式化字面量 let a = 123.000_111
                      2、忽略元组的元素值 let b = (404,"Not found") let a(_,c) = b  
                      3、忽略区间值 let m = 2 let n = 4 var mn = 2 for _ in 1...n {}
                      4、忽略外部参数名
 */

import Foundation

print("Hello, World!-->02控制流")

/********************************************二、控制流*************************************************/
//2.1条件语句
//2.1.1 if条件语句  1、if    2、 if else   3、 if   else if   else 
//2.1.2 if-let语句
        //使用场景：当使用可选值时，先用if判断它是否有值，如果有才对它强制解包，如果为nil，则不解包 使用if-let更简单易懂
        //语法格式：
            //if let 常量名 = 可选变量名 ... {
            //    语句
            //}
        //例子 对比if语句和if-let语句使用可选值的区别
            //func test() {
            //    //声明一个可选常量
            //    let a:Int? = 20
            //    if a == nil || a! <= 18 {
            //        return
            //    }
            //    //使用常量
            //    print(a!)
            //    
            //}

            let b:Int? = 10    //tip: swift3.0中where被移除，改为，
            if let c = b, c > 8 {
                print("测试if-let语法\(c)")
            }
//2.1.3 guard 语句 swift2.0后引入.与swift类似，不同的是它只有一个代码块，并且只会在表达式判断为false时执行后续代码块，否则会跳出整个guard
    //语法格式
            //guard let 常量名 = 可选变量名 ...else {
            //    执行语句
            //}
    //例子
func guardCase(){
    let a:Int? = 20
    guard let b = a, b > 24 else {
        print("a < 24")
        return
    }
    print("测试guard a的值为\(a!)")
}
guardCase()
/*
    tip: 1、在guard语句的else中一定要有返回的语句，如return continue break throw这种提早退出的关键字
 */
//2.1.4 switch语句
//语法格式
        //switch (表达式)
        //{
        // case 常量表达式1
        //      语句1
        // case 常量表达式1
        //      语句1
        // case 常量表达式1
        //      语句1
        // default:
        //      语句 n+1
        //}
let coordinate1 = (0,0)
switch coordinate1 {
case(0,0):
    print("原点")
case(_,0):
    print("X轴")
case(0,_):
    print("Y轴")
case(-2...2,-2...2):
    print("矩形区域")
    //fallthrough
default:
    print("没有任何目标区域")
}
/*
    tip: 1、swift中,如果有default ,switch一定要包含变量的所有情况，不然将会报错;如果包含了所有情况，则可以去掉default
         2、与C和OC不同的是，swift中的switch没有break关键字，在每个case后面隐式加了Break，语法更安全更易用，如果想让它满足条件后又可以继续往下走，则使用fallthrough
 */



//2.2循环语句
//2.2.1 for-in循环
//它用来遍历一个范围（range），队列（sequence）、集合（collection）或系列（progression）里面所有的元素,执行一系列的语句
      //语法格式  
//        for index in var
//        {
//            代码块
//        }

/*
   例子
 //for i in 1...3
 //{
 //    print(i)
 //}
 //for _ in 1...3
 //{
 //
 //}
 */
/*
 tips:1、index常量只存在于循环的生命周期里。如果想在循环完成后访问index的值，或者想让index成为一个变量而不是常量，必须在循环之前进行声明
 2、如果知道区间内的每一项的值，可以使用下划线（_）来代替变量名忽略对值的访问
 */
//2.2.2 while 循环
     //语法格式
            //while 循环条件
            //{
            //
            //}
/*
 tips: 1、while 循环条件语句中只能写一个表达式，而且是一个bool类型的表达式，那么如果循环体中需要循环变量，就必须在while语句之前对循环变量进行初始化
       2、死循环是无法靠自身控制终止的循环，一般写法为
        while true {
           statement(s)
       }
       3、for循环在swift3.0中被移除
 */
//2.2.3repeat-while循环
   //在swift2.0中经典的do-while语句改为了repeat-while。
   //repeat-while语法格式:
            //repeat{
            //    代码块
            //} while 循环条件





























