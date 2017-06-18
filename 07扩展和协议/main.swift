//
//  main.swift
//  07扩展和协议
//
//  Created by Li_JinLin on 2017/6/18.
//  Copyright © 2017年 Li_JinLin. All rights reserved.
//

import Foundation

print("Hello, World!-->扩展和协议")

/********************************************七、扩展和协议*************************************************/
//扩展可以为一个已有的类、结构体、枚举或者协议添加新功能。协议是为方法、属性等定义一套规范，没有具体的实现。两者相互独立，又相辅相成。
//7.1扩展
//7.1.1 概述
//声明格式
//extension 类型名{
//    //增加新功能
//}
//继承也可以为类增加新功能，与继承相比，扩展的功能更加强大，比如一个被定义为final的类，无法通过继承增加新功能，但是扩展可以实现。这也说明扩展可以在没有获取远吗权限的情况下，仍然可以通过扩展类型的功能。另外，继承只针对类，不适用于结构体和枚举
/*
    tip:如果定义了一个扩展，向一个已有类型添加新功能，那么这个新功能对钙类型的所有实例都是可用的，即使它们是在这个扩展的前面定义的
 */

//7.1.2扩展计算型属性
//扩展可以为原类型增加计算抒情，包括计算型实例属性和计算型类型属性。基本数据类型的本质是结构体
//例
extension Double{
    var km:Double{
        return self * 1_000.0
    }
    var m:Double{
        return self
    }
    var cm:Double{
        return self / 100.0
    }
    var mm:Double{
        return self / 1000.0
    }
    
}
let oneKiolmeter = 1.km
print(oneKiolmeter)
let tenmilimeter = 10.mm
print(tenmilimeter)
let aMarathon = 42.km + 195.m
print(aMarathon)
/*
    tip:扩展可以添加计算型属性，但是不可以添加存储型属性，也不可以向已有属性添加属性观察器
 */
//7.1.3 扩展构造函数
//扩展构造函数就是为一个类型（类、结构体、枚举）添加新的构造函数
//例子
struct Size{
    var width = 0.0,height = 0.0
}
struct Point{
    var x = 0.0,y = 0.0
}
struct Rect {
    var origin = Point()
    var size = Size()
}
//调用默认构造函数创建函数实例
let defaultRect = Rect()
//调用逐一成员构造函数创建实例
let memberrect = Rect(origin:Point(x:2.0,y:2.0),size:Size(width:10.0,height:10.0))
//扩展构造函数
extension Rect {
    init(center:Point,size:Size) {
        let originX = center.x - size.width / 2
        let originY = center.y - size.height / 2
        self.init(origin:Point(x:originX,y:originY),size:size)
    }
}
//调用扩展的构造函数创建实例
let centerRect = Rect(center:Point(x:4.0,y:4.0), size:Size(width:4.0,height:4.0))
print(defaultRect.origin)
print(memberrect.origin)
print(centerRect.origin)
/*
 tips:类扩展构造函数:
        1、在为类类型扩展构造函数时，只可以扩展便利构造函数，如果添加新的指定构造函数或析构函数，程序会报错。指定构造函数必须由原始的类实现提供
        2、
 
 */
class Animal{
    var name:String
    var leg:Int
    func decription() -> String {
        return "\(name)有\(leg)条腿"
    }
    init(name:String,leg:Int) {
        self.name = name
        self.leg = leg
    }
}
//扩展
extension Animal{
    //便利构造函数
    convenience init(name:String){
        self.init(name: name, leg: 4)
    }
}

let a1 = Animal(name:"cat")
let a2 = Animal(name:"dog",leg:4)
print(a1.decription())
print(a2.decription())

//7.1.4扩展方法
//例子
extension Int{
    //定义普通方法
    static var num:Int = 4
    func legInt() -> Int {
        return self * Int.num
    }
    //定义可变方法
    mutating func legInt1(){
        self = self * Int.num
    }
}
let cat = 6.legInt()
print("6只猫有\(cat)条腿")
var cat1 = 6
cat1.legInt1()
print("6只猫有\(cat1)条腿")
/*
    tip ： 在结构体和枚举中给self赋值会报错，所以需要在方法前面加上mutating关键字，表示这是可变方法
 */
//7.1.5
//扩展可以使用subscript关键字向一个已有类型添加新下标
//例如
extension Int{
    subscript(index:Int)->Int{
        var base = 1
        for _ in 0...index{
            base *= 10
        }
        return (self/base) % 10
    }
}
print("输出个位的值:\(9876[0])")
print("输出十位的值:\(9876[1])")
print("输出百位的值:\(9876[2])")
print("输出千位的值:\(9876[3])")
print("输出万位的值:\(9876[4])")
print("输出十万位的值:\(9876[5])")

//7.2 协议
//7.2.1
//swift中的协议用于定义方法和属性，但是协议本身并不尽兴实现。而是由采纳该协议的类聚体实现。与OC不同的是，协议还可以被结构体和枚举采纳。
//01定义协议
//protocol 协议名称{
//    //协议内容
//}
//如果希望定义的协议只能被类采纳，则声明的格式为
//protocol 协议名称:class{
//    //协议内容
//}
//02采纳协议
//格式(类、枚举、结构体格式一样)
//struct 结构体名称: 协议名称{
//    结构体内容
//}
//采纳多个协议
//struct 结构体名称： 协议名称1，协议名称2...{
//    //结构体内容
//}
//如果是一个子类采纳协议,格式为
//class 子类名称: 父类名， 协议名称{
//    //类内容
//}

//7.2.2协议的要求
//01协议对属性的要求：在协议中定义属性的时候，必须要求定义的属性是只读的或者是可读可写的
//对于采纳协议的类型，可以灵活地实现协议的属性，聚体分为三种情况
//（1）、对于可读可写的属性，则实现属性不能是常量存储属性或只读的计算属性
//（2）、对于只读的属性，则实现属性可以是任意类型的属性
//（3）、允许为只读属性实现有效的setter方法
//通常情况下，协议中的属性会声明为变量。如果属性是可读可写的，需要在类型声明后面加上{get set}来表示，如果属性是只读的，则用{get}来表示。需要注意的是，如果声明的属性是一个类型属性，则需要在var关键字之前加上static关键字。
//格式
//protocol Protocol{
//    var setable:Int{get set}   //可读写属性
//    var onlyRead:Int{get}      //只读
//    static var typeProperty:Int{get set} //typeProperty类型属性
//}
//例如
protocol PersonProtocol{
    var fullName:String {get}
}
class StudentA: PersonProtocol {
    var surname:String
    var name:String
    init(surname:String,name:String) {
        self.surname = surname
        self.name = name
    }
    //实现协议中的属性
    var fullName: String{
        return surname + name
    }
}

let stuA = StudentA.init(surname: "li", name: "jinlin")
print(stuA.fullName)
//协议对方法的要求
//协议能够要求采纳协议的类型必须实现某些特定名称的实例丰富和类型方法。协议方法的声明与普通方法的定义格式类似，但是不需要打括号{}和方法体。
//01在协议中声明实例方法
protocol AnimalA{
    func shout()
}
class Dog: AnimalA {
    func shout() {
        print("🐶在叫")
    }
}
let dog = Dog()
dog.shout()

//02在协议中声明类型方法
protocol AnimalB{
    static func eat()
}
class DogB: AnimalB {
    static func eat() {
        print("🐶啃骨头")
    }
}

//03在协议中声明可变方法
//在协议中声明可变方法时，需要在方法的前面加上mutating关键字，这样结构体和枚举就能够通过采纳协议，对协议的可变方法进行实现，从而改变本身的值。而类在实现协议中的可变方法时，可以省略mutating，关键字
//例子
protocol ButtonProtocol{
    //定义可变方法
    mutating func toggle()
}
enum OnOffSwitch:ButtonProtocol {
    case Off,On
    mutating func toggle() {
        self = (self == .On) ? .Off : .On
    }
}
//设置开关的状态
var lightSwitch = OnOffSwitch.Off
lightSwitch.toggle()
print("开关的状态\(lightSwitch)")
lightSwitch.toggle()
print("开关的状态\(lightSwitch)")

//03协议对构造函数的要求
//协议可以要求采纳协议的类型实现特定的构造函数。在协议中定义构造函数的写法与普通构造函数的定义格式类似，但是不需要大括号{}和函数的聚体实现，
protocol someProtocol{
    init(someParameter:Int)
}
class someClass: someProtocol {
    required init(someParameter: Int) {
        print("初始化方法")
    }
}
//在类中实现协议的构造函数时，使用requaired修饰符是为了确保该类的所有子类必须提供次构造函数的实现，保证这些子类满足协议的要求。需要注意的是，final修饰的类在实现协议的构造函数时，不能使用requaired修饰符，因为被final修饰的类没有子类。当子类实现所采那协议中的构造函数时，如果该构造函数与重写的父类的制定构造函数相同，那么在子类实现该构造函数时，必须在init前面加上requaired和overvide关键字
//可选协议：如果协议中声明的内容是可选的也就是说采纳协议时可以实现也可以不实现，则通常称该协议为可选协议。在定义可选协议的时，要在可选内容的声明前加上@objc optional关键字。并且在声明协议时在protocol关键字前面加上@objc，可选协议只能被类采纳
@objc protocol AnimalC{
    //定义可选方法
    @objc optional func wing()
}
class Bird: AnimalC {
    @objc func wing() {
        print("鸟有翅膀")
    }
}
class DogC: AnimalC {
    //不实现可选方法
}
let bird =  Bird()
bird.wing()

/*
    tip:可选协议不能被枚举和结构体采纳
 */

//7.2.3协议作为类型使用
//协议作为类型使用的场景有：
//01作为函数、方法、构造函数中的参数类型或者返回值使用
//02作为常量、变量、属性的类型
//03作为数组、字典或者其他容器中的元素类型
//例子：作为参数类型
protocol NameProtocol{
    var name:String{get}
}
struct StudentB:NameProtocol {
    var name: String
}
//参数的类型为NameProtocol
func contact(student:NameProtocol){
    print("学生的名字\(student.name)")
}
let stuB = StudentB(name:"xiaoming")
contact(student: stuB)
//协议类型的集合
protocol AnimalM{
    var name:String {get}
}
//类
class Aclass:AnimalM{
    var name: String{
        return "狗"
    }
}
class Bclass: AnimalM {
    var name: String {
        return "猫"
    }
}
class Cclass: AnimalM {
    var name: String {
        return "猴子"
    }
}

let a = Aclass()
let b = Bclass()
let c = Cclass()
let animals:[AnimalM] = [a,b,c]
for ani in animals {
    print(ani.name)
}

//7.2.4协议的继承
//协议之间可以继承 语法格式和类的继承类似，不同的是，协议可以多继承。
//protocol InheritingProtocol:someProtocol,aProtocol,NameProtocol{
//    //协议定义
//}
//例子
protocol AnimalProtocol{
    var leg:String{get set}
    var wing:String{get set}
    func description() ->String
}
protocol FishProtocol:AnimalProtocol {
    var habit:String{get set}
}
class GoldFish:FishProtocol{
    var name:String
    //实现协议要求
    var habit: String
    var leg: String
    var wing: String
    func description() -> String {
        return "name:\(name) wing:\(wing),habit:\(habit),leg:\(leg)"
    }
    init(name:String,leg:String,wing:String,habit:String) {
        self.leg = leg
        self.habit = habit
        self.wing = wing
        self.name = name
    }
}
let fish = GoldFish.init(name: "金鱼", leg: "无", wing: "无", habit: "游泳")
print(fish.description())

//7.2.5检查协议一致性
//协议一致性的检查是通过is和as操作符来完成的，用法与类型的检查和转换基本相似。具体如下：使用is操作符检查实例是否采纳了某个协议，使用as操作符把实例类型转换到指定协议类型
//例子
protocol AreaProtocol{
    var area:Double{get}
}
class Rectangle: AreaProtocol {
    let long:Double
    var area: Double{
        return long * long
    }
    init(long:Double) {
        self.long = long
    }
}
class Circle: AreaProtocol {
    let pi = 3.1415926
    var radius:Double
    var area: Double{
        return pi * radius * radius
    }
    init(radius:Double) {
        self.radius = radius
    }
}
class BirdA {
    var wing:Int
    init(wing:Int) {
        self.wing = wing
    }
}
let objects:[AnyObject] = [Circle(radius:2.0),Rectangle(long:4.0),BirdA(wing:2)]
for object in objects{
    if let objectWithArea = object as? AreaProtocol{
        print("面积是：\(objectWithArea.area)")
    } else {
        print("没有面积")
    }
}
//代理模式
//代理是一种设计模式，它允许类或结构体将自身负责的功能委托给其他类型的实例去实现。代理模式的实现很简单，定义协议用于封装需要被委托的函数和方法，是采纳协议的类型拥有这些被委托的函数和方法
//例子
protocol GetFileProtocol{
    func take() -> String
}
class Assistant: GetFileProtocol {
    func take() -> String {
        return "助理给老板拿文件"
    }
}
class Boss {
    var delegate:GetFileProtocol
    init(manProtocol:GetFileProtocol) {
        delegate = manProtocol
    }
    func takeFile() -> String {
        return delegate.take()
    }
}
let addistant = Assistant()
let boss = Boss.init(manProtocol: addistant)
print(boss.takeFile())

//7.3扩展和协议的结合
//协议和拓展可以结合使用，可以通过扩展使一个已有类型采纳某个协议，也可以对现有协议进行扩展。
//7.3.1通过扩展采纳协议
//extension someType:someProtocol,anotherProtocol{
//    //协议实现
//}
//例子
protocol AnimalH{
    var getName:String{get}
    
}
class DogH{
    func shout() -> String {
        return "汪汪汪"
    }
}
//通过扩展使得DogH类采纳并实现AnimalH协议
extension DogH:AnimalH{
    var getName: String {
        return "狗🐶"
    }
}
let dogH = DogH()
print(dogH.shout())
print(dogH.getName)
//通过空扩展采纳协议
//当一个类已经符合了某个协议中的所有要求，却还没有声明采纳该协议时，类型不会自动采纳协议，此时可以定义为空扩展来采纳该协议
protocol GetKind{
    var getKind:String{get}
}
//
struct StudentD{
    var name:String
    var getKind:String{
        return "这个学生的名字是\(name)"
    }
}
//通过空扩展采纳协议
extension StudentD:GetKind{}
let Jayh = StudentD(name:"Jay")
//StudentD实例作为GetKind类型使用
let hhJ:GetKind = Jayh
print(hhJ.getKind)

//7.3.2 协议扩展
//协议可以通过扩展来为采纳协议的类型提供属性、方法及下标脚本的实现
//例子
protocol AnimalHProtocol{
    func shout()-> String
}
extension AnimalHProtocol{
    func eat() -> String {
        return "啃骨头"
    }
}
class DogPD: AnimalHProtocol {
    func shout() -> String {
        return "汪汪汪"
    }
}

let dogGG = DogPD()
print("\(dogGG.shout())")
print("\(dogGG.eat())")





