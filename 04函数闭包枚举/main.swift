//
//  main.swift
//  04函数闭包枚举
//
//  Created by Li_JinLin on 2017/6/15.
//  Copyright © 2017年 Li_JinLin. All rights reserved.
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
noreturn(a:10, b:6)
func test(a:String,b:Bool)->(){
    print("test")
}
test(a:"string", b:true)
func test2(a:Int) -> Void {
    print(a)
}
test2(a:9)

//多返回值
func count(a:Int,b:Int,c:Int)->(minus:Int,sum:Int,multiply:Int){
    var minus1 = 0,sum1 = 0,multiply1 = 0
    minus1 = a - b
    sum1 = a + c
    multiply1 = b * c
    return(minus1,sum1,multiply1)
}
let xCount = count(a: 10, b: 2, c: 4)
print(xCount.minus)
print(xCount.sum)
print(xCount.multiply)
//可选元组返回类型函数(使用场景：如果函数返回的元组类型可能整个元组都没有值，那就可以使用可选的元组返回类型来反映元组是nil的实时，通过在元组类型的右括号后面防止一个问号来定义一个可选的元组)
//例：
func minMax(array:[Int])->(min:Int,max:Int)?{
    if array.isEmpty {
        return nil
    }
    //定义两个变量用于记录最大值和最小值
    var currentMin = array[0]
    var currentMax = array[0]
    for value in array {
        if value < currentMin {
            currentMin = value
        } else if value > currentMax {
            currentMax = value
        }
    }
    return (currentMin,currentMax)
}
if let bounds = minMax(array:[10,5,9,0,-6]){
    print("min is\(bounds.min) max:\(bounds.max)")
    let (min,_) = bounds
    print(min)
}

//5.1.2局部参数名和外部参数名
//01局部参数名只能在函数本身的主体中使用，无法在调用函数时使用
//例
func someFunction(firstParameter:Int,secondParameter:Int){
    //函数体
    print(firstParameter)
    print(secondParameter)
}
someFunction(firstParameter: 1, secondParameter: 2)
//02外部参数名，是指在参数名的前面再增加一个参数名，如果为参数直飞那个了外部形参名，调用的时候就必须显式的使用
//基本格式
//func 函数名(外部参数名1  参数1：参数类型，外部参数名2 参数2：参数类型)->Int{
//    函数体
//    return 返回值
//}
//例如
func compare(num1 x:Int, num2 y:Int)->Int{
    return x > y ? x :y
}
print(compare(num1: 6, num2: 8))
//5.1.3函数参数的其他用法
//01默认参数值
func sayHaHa(message:String,name:String = "Jack"){
    print("\(message),\(name)")
}
sayHaHa(message: "Good morning!")
sayHaHa(message: "Welcome To China", name: "小明")

//02可变参数
//一个可变参数可以接受零个或者多个指定类型的值。函数调用时，使用可变参数来指定函数参数可以被不确定数量的输入值，通过在变量类型名称后面加...的方式来定义可变参数
//例如：计算平均值
func average(numbers:Double...)->Double{
    var total:Double = 0
    for num in numbers {
        total += num
    }
    return total / (Double)(numbers.count)
}

print(average(numbers: 1.0,2.0,3.0))
print(average(numbers: 1.5,6.3,4.9,7.4))

//03 In-Out(输入输出)参数
//说明：一般参数仅仅是在函数内可以改变的，当这个函数执行完后变量就会被销毁，如果想要通过一个函数可以修改参数的值，并且让这些修改在函数调用结束后仍然存在，这时可以将这个参数定义为输入输出函数即可。定义一个输入输出函数时，只要在参数类型前面加上inout关键字即可
//例如
func swapTwoInts(a:inout Int,b:inout Int){
    print("交换前\(a)--\(b)")
    let tem = a
    a = b;
    b = tem
    print("交换后\(a)--\(b)")
}
var temp1 = 66
var temp2 = 88
swapTwoInts(a: &temp1, b: &temp2)
print("\(temp1),\(temp2)")
//打印后发现temp1、temp2的值发生了交换，这表示这两个参数的值在函数体中被修改了，尽管他们定义在函数体外。需要注意的是，输入输出参数和返回值是不一样的，swapTwoInts函数并没有定义任何返回值，但是仍然修改了temp1、temp2的值，这表明输入输出参数是一个函数的另一个影响函数体范围之外的方式
//04 嵌套函数
//前面定义的函数全是在全局作用域中，全局函数是把函数定义在其他的函数体中。默认情况下，嵌套函数是对外界不可见的，但是可以被其外围函数所调用
//例
func calculate(opr:String)->(Int,Int)->Int{ //(Int,Int)->Int是一个整体，是一个函数，(Int,Int)两个参数，->Int
    //定义加法
    func add(a:Int,b:Int)->Int{
        return a + b
    }
    //定义减法
    func sub(a:Int,b:Int)->Int{
        return a - b
    }
    //定义一个局部变量
    var result:(Int,Int)->Int// (Int,Int)两个参数，->Int 是result的返回值类型
    switch (opr) {
    case "+":
        result = add(a:b:)
    case "-":
        result = sub(a:b:)
    default:
        result = add(a:b:)
    }
    return result
}

//4.2闭包
//全局函数和嵌套函数就是特殊的闭包，闭包是一个功能性自包含模块，可以在代码中被当做参数传递或则直接使用，类似于C、OC中的block或者其他语言中的匿名函数，
//4.2.1闭包的表达式语法的一般形式为:
//{
//    {参数1：参数类型，参数2：参数类型...}->返回值类型 in
//    闭包函数体
//    return 返回值
//}
/*
    在上述的语法格式中，闭包是可以定义参数和返回值，其中，参数类型可以是常量、inout类型的参数、可变参数、元组类型，但是不能在闭包参数中设置默认值，而且定义返回值与函数返回值的规则相同。 in关键字表示闭包的参数和返回值类型已经完成，这些参数和返回值将在下面的函数体中得到处理
 */
//例子
let sumFunc = {
    (x:Int,y:Int)->Int in
    return x + y
}
print("测试闭包\(sum(a: 16, b: 18))")
//tip : 与调用函数不同，在调用闭包时，闭包参数并不会出现在外部参数名
//闭包当参数使用
func testFunc(sumFunc:Int,y:Int)->Int{
    return sumFunc + y
}
print("测试闭包当参数使用\(testFunc(sumFunc: 10, y: 8))")
//tip:如果一个闭包没有参数和返回值，那么基本格式中的参数列表、返回值、in都可以省略掉，这是最简单的闭包
let simpleFunc = {
    print("这是最简单的闭包")
}

//4.2.2使用尾随闭包
//在swift中，尾随闭包是一个书写在函数括号之后的闭包表达式，函数支持将其作为最后一个参数使用
func calculates(opr:String,funN:(Int,Int)->Int){
    switch opr {
    case "+":
        print("10 + 5 = \(funN(10,5))")
    default:
        print("10 - 5 = \(funN(10,5))")
    }
}
calculates(opr: "+") { (a:Int, b:Int) -> Int in
    return a + b
}
calculates(opr: "-") { (a:Int, b:Int) -> Int in
    return a - b
}
//函数funN是funN:(Int,Int)->Int函数类型，该参数可以接收闭包函数。
/*
    tip:要使用尾随闭包，则闭包必须是参数列表的最后一个参数，如果不是最后一个的话无法使用尾随闭包写法
 */

//4.2.3使用闭包表达式

//swift中闭包的表达式相当灵活，针对某些情况它提供了多种闭包的简化写法
///01根据上下文推断类型：swift可以根据上下文环境推断出参数类型和返回值了，标准形式的闭包如下

//{(a:Int,b:Int)->Int in
//        return a + b
//}
//swift 能够推断出参数a和b都是Int类型的，返回值也是Int类型的，可以简化为如下形式：
//{a,b in return a + b}
//使用这种简化的形式，具体如下
func calculateC(opr:String)->(Int,Int)->Int{  //(Int,Int)->Int是一个函数，此时函数作为返回值传递
    var result:(Int,Int)->Int
    switch opr {
    case "+":
        result = {a,b in return a + b}
    default:
        result = {a,b in return a - b}
    }
    
    return result
}
//调用该函数
let val1:(Int,Int)->Int = calculateC(opr: "+")
print("1 + 2 = \(val1(1,2))")
let val2:(Int,Int)->Int = calculateC(opr: "-")
print("1 + 2 = \(val2(1,2))")

//02单行闭包表达式可以省略return 关键字

//如果在闭包内部的语句组中仅仅只有一条语句，如 return a + b等，那么这种语句就是返回语句，前面的关键字return可以省略,省略后的代码形式如下
//{a,b in a + b}
//上述代码简化后如下
func calculateD(opr:String)->(Int,Int)->Int{
    var result:(Int,Int)->Int
    switch opr {
    case "+":
        result = {a,b in a + b}
    default:
        result = {a,b in a - b}
    }
    
    return result
}

//03参数名称缩写

//前面的闭包已经变得很简洁，不过还可以继续进行简化，swift提供了参数名称缩写功能。用$0、$1、$2代表第一个、第二个、第三个...参数，除此之外，还可以省略参数列表的定义，这是因为swift可以推断出缩写参数的类型。同时，in关键字也可以省略。使用这些简化方式，修改上述代码如下
func calculateE(opr:String)->(Int,Int)->Int{
    var result:(Int,Int)->Int
    switch opr {
    case "+":
        result = {$0 + $1}
    default:
        result = {$0 - $1}
    }
    return result
}

let f1:(Int,Int)->Int = calculateD(opr: "+")
print("参数名缩写后的结果:1 + 2 = \(f1(1,2))")
let f2:(Int,Int)->Int = calculateD(opr: "-")
print("参数名缩写后的结果:1 - 2 = \(f2(1,2))")

//04使用闭包返回值

//闭包实质上是函数类型，是有返回值的，可以直接在表达式中使用闭包的返回值。
//例子
let r1 = {(a:Int,b:Int)->Int in
        return a + b
}(10,5)
print(r1)
//在闭包末尾的花括号后面跟上一对小括号，通过小括号给闭包参数。
var r = {(a:Int,b:Int)->Int in
    return a + b
}
let mn = r(3,9)
print(mn)
//通过这种方式可以直接为常量或者变量赋值，某些场景下使用非常方便

//4.2.4 捕获

//嵌套函数或者闭包可以在其定义的上下文中捕获常量，即使定义的这些常量或者变量的原作用域已经不存在了，仍然可以在闭包函数体内引用和修改这些常量或者变量，这种机制被称为捕获。比如，嵌套函数就可以捕获福函数的常量和变量，闭包可以捕获其上下文中的常量或者变量
//例如
func makeArray()->(String)->[String]{
    var array:[String] = [String]()
    func addElement(element:String)->[String]{
        array.append(element)
        return array
    }
    return addElement(element:)
}
let kw = makeArray()

print("--\(kw)--")
print(kw("Jack"))
print(kw("Rose"))
print(kw("Tom"))
print(kw)


let mw = makeArray()
print(mw("小明"))
print(mw("小红"))
print(mw("李华"))
//通过打印可以发现，每次函数makeArray被调用，变量array都能够被保持

//4.3 枚举
//4.3.1 枚举为一系列相关联的值定义了一个公共的组类型，同时可以再类型安全的情况下去使用这些值。在C语言中枚举类型就是一系列具有被指定有关联名称的整数值，而在swift中，枚举类型更加灵活，并且不必给枚举类型中的每一个成员都赋值
//语法格式
//enum 枚举名 {
//    //枚举定义放在这里
//}
enum WeekDays1 {
    case Monday,Tuesday,Wednesday,Thursday,Friday
}
enum WeekDays {
    case Monday
    case Tuesday
    case Wednesday
    case Thursday
    case Friday
}
//枚举在被创建的时候，枚举成员不会被赋予一个默认的整型值。如果给一个枚举成员提供一个值，这个值被称为原始值，而且该值的类型可以是字符串、字符、整型值或者浮点数
//若要访问枚举的成员值，可以通过完整的“枚举类型.成员值”的形式，也可以省略枚举类型通过“.成员值”的形式，这种省略形式能够访问的前提是，swift能够根据上下文环境推断类型。
var day = WeekDays.Friday
day = .Monday

//4.3.2使用switch语句匹配枚举值
//枚举类型可以和switch语句很好地配合使用，通过使用switch语句来匹配单个枚举值，而且可以没有default分支，这在使用其他类型是不允许的。
//例
func writeSundays(day:WeekDays){
    switch day {
    case .Monday:
        print("星期一")
    case .Tuesday:
        print("星期二")
    case .Wednesday:
        print("星期三")
    case .Thursday:
        print("星期四")
    case .Friday:
        print("星期五")
    }
}
//注意：default省略时，此时枚举必须列出所有的情况，不能遗漏
//函数使用
var day2 = WeekDays.Wednesday
day2 = .Thursday
writeSundays(day: day2)
//4.3.3原始值
//出于业务上的需求，要为每个成员提供某种具体类型的默认值，为此，可以为枚举类型提供原始值声明，这些原始值的类型可以是字符、字符串、整数、浮点数等。
//语法格式
//enum 枚举名：数据类型
//{
//    case 成员名 = 默认值
//}
enum WeekDays2 : Int {
    case Monday     = 0
    case Tuesday    = 1
    case Wednesday  = 2
    case Thursday   = 3
    case Friday     = 4
}
//简化写法
enum WeekDays3 : Int {
    case Monday = 0,Tuesday,Wednesday,Thursday,Friday
}




















//4.3枚举

