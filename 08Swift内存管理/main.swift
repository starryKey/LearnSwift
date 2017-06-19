//
//  main.swift
//  08Swift内存管理
//
//  Created by Li_JinLin on 2017/6/19.
//  Copyright © 2017年 Li_JinLin. All rights reserved.
//

import Foundation

print("Hello, World!-->八、扩展和协议")

/********************************************八、扩展和协议*************************************************/
//Swift内存管理机制
//swift没存管理的目标是类所创建的对象，也就是引用类型。引用类型的实例保存在内存的“堆”区，需要人为管理。而整型、浮点型、布尔型、字符串型、元组、集合、枚举和结构体等，都属于值类型，保存在内存的堆区，在运行时由处理器管理它们的类型，不需要程序员管理，Swift对类的对象的管理采用ARC（自动引用计数）机制
//9.1.1自动引用计数工作机制
//Swift需要对对象的内存机制进行管理，当一个对象不再被使用时，就需要将它的内存释放。Swift给每个对象设置了一个内部计数器，成为引用计数器。当对象被创建时，引用计数器为1，每次当对象被引用时，引用计数加1，每减少一次时，引用计数减1，当对象的引用计数为0时，释放对象的内存。
//例子 比如会议室的人员进出，当人进来时，引用计数+1，人走时引用计数-1，引用计数为0时，会议室的占用结束，然后才能用于其他会议
//9.1.2自动引用计数示例
class Person{
    let name:String
    let age:String
    init(name:String,age:String) {
        self.name = name
        self.age = age
        print("对象构造完成:\(name)")
    }
    deinit {
        print("对象析构完成:\(name)")
    }
}
//定义三个对象，引用一个实例
var reference1:Person?
var reference2:Person?
var reference3:Person?
reference1 = Person(name:"小明",age:"20")   //Person对象的引用计数为：1
reference2 = reference1                    //Person对象的引用计数为：2
reference3 = reference2                    //Person对象的引用计数为：3
reference1 = nil                           //Person对象的引用计数为：2
reference2 = nil                           //Person对象的引用计数为：1
reference3 = nil                           //Person对象的引用计数为：0   //Person对象被释放

//9.1.3 类实例之间的循环强引用
//当出现对象之间的循环强引用时，对象的引用数量永远不可能为0。当两个对象的存储属性互相强引用对方的时候，只有当其中一个对象释放时，才会释放对另一个对象的引用。但是由于两个对象各自的引用计数永远大于0，所以谁都无法释放。这就是对象间的循环强引用
class PersonA{
    let name:String
    var apartment:Apartment?
    init(name:String) {
        self.name = name
        print("PersonA构造完成:\(name)")
    }
    deinit {
        print("PersonA析构完成")
    }
}
class Apartment{
    let unit:String
    var tenant:PersonA?
    init(unit:String) {
        self.unit = unit
        print("Apartment公寓构造完成")
    }
    deinit {
        print("Apartment公寓被析构了")
    }
}
var jack:PersonA?
var apartment:Apartment?
jack = PersonA.init(name: "Jack")             //jack强引用PersonA
apartment = Apartment.init(unit: "666室")     //apartment强引用Apartment
jack?.apartment = apartment                   //jack对象对apartment有一个强引用
apartment?.tenant = jack                      //apartment对象对jack有一个强引用
jack = nil                                    //jack与PersonA之间的强引用断开
apartment = nil                               //apartment与Apartment之间的强引用断开
                                              //此时PersonA和Apartment对象的引用计数为1，都拥有对对方的强引用，两个对象均未释放
//8.1.4 解决类实例之间的循环强引用
//当出现强引用循环时，除非程序结束，否则两个对象永远无法释放，这就造成了内存泄露，因此在开发中要解决循环强引用的问题。Swift中有两种解除循环强引用的方式--弱引用和无主引用，原理都是使对象引用另一个对象但是不使用强引用。对于生命周期中会变成nil的实例使用弱引用，对于初始化赋值后再也不会被赋值会nil的对象使用无主引用
//弱引用和强引用的区别在于，弱引用不会增加实例的引用计数，因此弱引用不能阻止ARC对被引用对象的销毁。使用弱引用的方法是在声明属性或者变量时，在前面加上weak关键字。弱引用必须被声明为变量，表明在运行时可以修改它的值。而且使用弱引用的属性或变量必须是可选类型，即它的值可能为nil
//01弱引用
class PersonB{
    let name:String
    var apartment:ApartmentB?
    init(name:String) {
        self.name = name
        print("PersonB构造完成:\(name)")
    }
    deinit {
        print("Personb析构完成")
    }
}
class ApartmentB{
    let unit:String
    weak var tenant:PersonB?        //弱引用，引用计数不会+1
    init(unit:String) {
        self.unit = unit
        print("ApartmentB公寓构造完成")
    }
    deinit {
        print("ApartmentB公寓被析构了")
    }
}
var john:PersonB?
var unit666:ApartmentB?
john = PersonB(name:"John")
unit666 = ApartmentB(unit:"房间号666")
john?.apartment = unit666
unit666?.tenant = john
john = nil
unit666 = nil
//由于对PersonB的引用是弱引用，所以PersonB对象会被释放。PersonB被释放后，对ApartmentB对象的强引用断开，ApartmentB对象也就释放了

//02无主引用
//与弱引用类似，无主引用也不会保持所引用的对象，也不能阻止被引用对象的销毁。与弱引用不同的是，无主引用用于非可选类型，即它的值不会变成nil.声明无主引用的属性或变量时，需要在爱前面加上unowned关键字。由于无主引用是非可选类型，所以无主引用总是被直接访问。ARC无法在实例被销毁后将无主引用设为nil，访问被销毁的无主引用会触发运行时错误，程序会直接崩溃。所以要确保访问的无主引用永远指向一个未销毁的独享
class PersonC{
    let name:String
    var apartment:ApartmentC?
    init(name:String) {
        self.name = name
        print("PersonC构造完成:\(name)")
    }
    deinit {
        print("PersonC析构完成")
    }
}
class ApartmentC{
    let unit:String
    unowned var tenant:PersonC        //无主引用，引用计数不会+1
    init(unit:String,tenant:PersonC) {
        self.unit = unit
        self.tenant = tenant
        print("ApartmentC公寓构造完成")
    }
    deinit {
        print("ApartmentC公寓被析构了")
    }
}

var lotus:PersonC?
lotus = PersonC(name:"Lotus")  //lotus变量持有了PersonC对象的强引用
lotus?.apartment = ApartmentC(unit:"房间号001",tenant:lotus!)//使用lotus引用的对象创建了一个ApartmentC的对象，使得ApartmentC对象持有了Person对象的无主引用。然后将ApartmentC对象直接赋值给lotus所引用对象的属性，使得PersonC对象持有了对Apartment对象的强引用。
lotus = nil
/*
    tip：无主引用和隐式解析可选属性
 */
//当两个实例的属性都允许为nil时，适合使用弱引用；当一个属性允许为nil，另一个属性不允许为nil时用隐式解析可选属性
//例子
class Country{
    let name:String
    var capitalCity:City!
    init(name:String,capitalCity:String) {
        self.name = name
        self.capitalCity = City(name:capitalCity,country:self)
    }
    deinit {
        print("Country对象被销毁了")
    }
}

class City{
    let name:String
    unowned var country:Country
    init(name:String,country:Country) {
        self.name = name
        self.country = country
    }
    deinit {
        print("City对象被销毁了")
    }
}
var country:Country? = Country(name:"China",capitalCity:"Beijing")
print("国家：\(country!.name)首都：\(country!.capitalCity.name)")
country = nil

//8.2闭包引起的循环强引用
//闭包和类之间产生强引用的情景出现在将闭包赋值给类的属性，同时在闭包内部引用了这个类的实例时。究其原因，是因为闭包也是引用类型，当在闭包内部引用类的实例属性和方法时，闭包默认对类的实例拥有强引用。要解决这个问题，需要使用闭包捕获列表
//9.2.1闭包引起的循环强引用
//闭包和类实例之间的循环强引用是指当闭包被赋值给类实例的某个属性，并且在闭包中又使用了这个类实例时，这个闭包体中可能访问了实例的某个属性，或者在比保重调用了实例的某个方法，这两种情况都导致了闭包捕获了self，从而产生循环引用
//例如
class Student{
    var name:String?
    var score:Int
    lazy var level:(Void)->String = {
        switch self.score{
        case 0..<60:
            return "C"
        case 60..<85:
            return "B"
        case 85...100:
            return "A"
        default:
            return "D"
        }
    }
    init(name:String,score:Int) {
        self.name = name
        self.score = score
    }
    deinit {
        print("Student:\(name!) 被析构了")
    }
}

var Tom:Student? = Student(name:"Tom",score:90)
print("学生姓名：\(String(describing: Tom!.name)),分数\(Tom!.level())")    //此时没有打印析构的内容，说明引起了循环引用
Tom = nil
//当Tom = nil时将Tom变量和Student对象之间的强引用断开，但是由于Student对象和闭包之间的强引用形成了死循环，所以Student对象和它的闭包并没有释放。
//9.2.2 解决闭包引起的循环强引用
//swift通过捕获列表来显示地指定闭包对捕获对象的弱引用或者无主引用
//01捕获列表
//具体格式
//[weak self,unowned delegate = self.delegate]
//捕获列表的声明有两种情况
//1、如果闭包有参数列表和返回值，把捕获列表放在参数类型前面
//lazy var someClosure:(Int,String)->String{
//    [unowned self,weak delegate = self.delegate!]
//    (index:Int,stringToProcess:String)->String in
//    //闭包的函数体
//}
//2、如果闭包没有显示地致命参数列表或者返回类型，那么也要把捕获列表放在关键字in的前面。此时关键字in不能省略
//lazy var ssomeClosure:Void ->String = {
//    [unowned self,weak delegate = self.delegate!] in
//    //闭包的函数体
//}
//02弱引用和无主引用

class StudentA{
    var name:String?
    var score:Int
    lazy var level:(Void)->String = {
        [weak self] in
        switch self!.score{ //self可能为nil，需要对其强制解包
        case 0..<60:
            return "C"
        case 60..<85:
            return "B"
        case 85...100:
            return "A"
        default:
            return "D"
        }
    }
    init(name:String,score:Int) {
        self.name = name
        self.score = score
    }
    deinit {
        print("Student:\(name!) 被析构了")
    }
}

var stu1:StudentA? = StudentA(name:"Lee",score:86)
print("学生的姓名:\(String(describing: stu1!.name)),等级为：\(stu1!.level)")
stu1 = nil
//也可以将level属性定义为无主引用
//将
//[weak self] in
//switch self!.score{
//改为
//[unowned self] in
//switch self.score{










































