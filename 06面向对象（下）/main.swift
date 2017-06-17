//
//  main.swift
//  06面向对象（下）
//
//  Created by Li_JinLin on 2017/6/16.
//  Copyright © 2017年 Li_JinLin. All rights reserved.
//

import Foundation

print("Hello, World!-->面向对象（下）")

/********************************************五、面向对象（下）*************************************************/
//6.1面向对象的三大特性
//01封装：把对象的属性和行为封装起来，不需要让外界关心内部的具体实现细节，外界只能通过接口使用该对象，而且不能通过任何形式修改对象内部实现。
//02继承：主要描述的是类与类的关系，通过继承，可以在不必重写类的情况下，使用原有的类的功能和进行拓展。
//03多态：多态与继承密切相关，对象的多态时指在父类中定义的属性或者方法被子类继承后，可以使同一个属性或者非法在父类及其各个子类中具有不同的含义，简单来说就是一种行为产生多种效果
//总的来说，封装可以隐藏实现细节同时包含私有成员，是的代码模块化并增加安全指数；继承可以拓展已经存在的模块，目的是为了代码的重用；多态则是为了保证类在继承和重写的时候，继承体系中任何类的实例都能被正确调用，实现了接口重用

//6.2.1继承和重写
//如果一个类只能继承一个父类，这叫做单继承，但有时，一个子类可以继承多个不同的父类，这种情况叫做多重继承。在swift中，类的继承只能是单继承，但是可以遵守多个协议从而达到多重继承的效果
/*
   tip: 在OC中，所有的类都是继承自NSObject，但是swift不同，swift中的类并不都从一个通用的类继承而来，如果在定义类时不给他指定父类，则曾类自己就成为了基类
 */
//例子01 属性的继承和方法的继承
class Person {
    //存储属性
    var age = 20
    //计算属性
    var name:String{
        return "Tom"
    }
    //类型属性
    static var kind = "人类"
    
    //方法的继承
    func printName() {
        print("名字\(name)")
    }
}

class Student: Person {
    //增加属性和方法
    var subject = "History"
    func doHomework(){
        print("写作业")
    }
    
}
var stu1 = Student()
print("年龄\(stu1.age)")
print("姓名\(stu1.name)")
stu1.printName()
print(Student.kind)
print(stu1.subject)
stu1.doHomework()

//02属性观察器的继承

class PersonM {
    //存储属性
    var age = 20 {
        willSet {
            print("新的年龄是\(newValue)")
        }
        didSet{
            if age > oldValue {
                print("比原来多了\(age - oldValue)岁")
            } else {
                print("比原来少了\(oldValue - age)岁")
            }
        }
    }
}
class StudentM: PersonM {
    
}
let newStu = StudentM()
newStu.age = 18
newStu.age = 22

//03下标脚本的继承
class PersonE{
    var languageA = "C"
    var languageB = "OC"
    var languageC = "Swift"
    subscript(index:Int)->String{
        switch index{
            case 0:
                return languageA
            case 1:
                return languageB
            case 2:
                return languageC
            default:
                return "JS"
        }
    }
}
class StudentE: PersonE {
    
}
let newStudent = StudentE()
print(newStudent[0])
print(newStudent[1])
print(newStudent[2])

//6.2.2重写
//子类可以重写父类的属性、方法、下脚标，重写某个特性时再前面加上override
//01属性的重写
class Animal  //定义基类
{
    //存储属性
    var legs = 2
    //只读计算属性
    var description:String{
        return "野生动物"
    }
    //类型属性
    class var kind:String {
        return "猫科动物"
    }
}

class cat: Animal {
    //重写存储属性
    override var legs:Int{
        get {
            return 4
        }
        set {
            self.legs = newValue
        }
    }
    //重写计算属性
    override var description:String {
        return "食肉动物"
    }
    override  class var kind:String {
        return "凶猛野兽"
    }
}

//定义基类变量
let animal = Animal()
print("\(animal.description)有\(animal.legs)条腿，属于\(Animal.kind)")
//定义子类变量
let lion = cat()
print("\(lion.description)有\(lion.legs)条腿，属于\(cat.kind)")
/*
    tips:在重写属性时，需要注意:
        1、无论继承的属性是存储属性还是计算属性，子类都可以通过提供getter和setter对属性进行重写，但是重写时一定要显示地写出属性的名字和类型，这样，编译器才会将重写的属性与分类中同名同类型的属性相匹配
        2、可以将一个继承来的属性重写为一个读写属性，只要在重写版本里提供getter和setter方法即可
        3、不可以将继承来的读写属性重写为一个只读属性
        4、乳沟在重写属性石提供了setter方法，那么一定要提供getter方法
 */

//02属性观察器的重写
//子类可以通过重写为继承来的属性增加属性观察器，这样，当属性值发生改变时，子类就可以得到通知
//定义基类
class AnimalA {
    //存储属性
    var legs = 2{
        willSet{
            print("Animal willSet \(newValue)")
        }
        didSet{
            print("Animal didSet")
        }
    }
    //下标脚本
    var a = "Ani"
    var m = "ma"
    var l = "l"
    
    subscript(index:Int)->String{
    
        switch index{
        case 0:
            return a
        case 1:
            return m
        case 2:
            return l
        default:
            return "Animals"
            
        }
    
    }
    //方法重写
    func eat(){
        print("肉食性动物")
    }
}
class CatA: AnimalA {
//    属性观察器重写
    override var legs: Int{
        willSet{
            print("Cat willSet\(newValue)")
        }
        didSet{
            print("Cat didSet")
        }
    }
//    方法重写
    override func eat() {
        print("猫吃老鼠")
    }
//    下标脚本重写
    override subscript(index:Int)->String{
        switch index{
            case 0:
                return "hhh"
            case 1:
                return "mmm"
            case 2:
                return "ooo"
            default:
                return "hhs"
        }
    }
}

let animala = AnimalA()
animala.eat()
let cata = CatA()
cata.legs = 4
cata.eat()
/*
    tips: 1、无论父类有没有为该属性好添加属性观察器，子类都可以添加属性观察器，如果父类已经添加了观察器，当属性发生变更时，父类和子类都会得到通知
          2、属性观察器不能用于计算属性，只鞥用于存储属性，因为计算属性在setter里面就可以得到属性值的变化
 */

//6.2.4 final关键字的使用
//可以在定义类和类的成员时使用final关键字，含义如下
//01在关键字class前增加final可以将整个类标记为final，这样的类是不能被继承的
//02在类的定义中将方法、属性、或下标脚本标记为final可以防止它们被重写，只需要在声明关键字前面加上final即可

//6.2.5  super关键字的使用
//当在子类重写父类的方法、属性、下标脚本时，有时在重写版本中使用已经存在的父类实现会大有益处。比如，可以完善已经实现的行动，或在一个继承来的变量中存储一个修改过的值。访问父类的成员使用的是super前缀，super的用处如下：
/*
    1、访问父类的属性。在属性的getter或setter的重写实现中，可以通过super.someProperty来访问父类本本的someProperty属性
    2、访问父类的方法。在方法someMethod()的重写实现中，可以通过super.someMethod()来调用父类版本的someMethod（）方法
    3、访问父类的下标脚本。在下标脚本的重写实现中，可以通过super[someIndex]来访问父类版本中的相同的下标脚本
 */
//super关键字的使用实例
class PersonH{
    //实例属性
    var name:String?
    var age:Int?
    //实例方法
    func description(){
        print("名字:\(name!)年龄:\(age!)")
    }
    //下标脚本
    subscript(index:Int)->String{
        switch index{
        case 0:
            return self.name!
        default:
            return "error"
        }
    }
}

class emplooyee: PersonH {
    //新增实例属性
    var company:String?
    //重写实例属性
    override var age: Int?{
        get{
            return super.age! + 10
        }
        set {
            super.age = age! - 5
        }
    }
    //重写实例方法
    override func description() {
        super.description()
        print("在大华工作")
    }
    //重写下标脚本
    override subscript(index:Int)->String{
        switch index{
            case 0:
                return self.company!
            default:
                return "hahahaha"
        }
    }
}

//6.3构造函数的继承和重写
//构造函数分为指定构造函数和便利构造函数。在构造过程中通过构造函数代理帮助完成部分构造工作，子类的指定构造函数通过调用父类链的构造函数来实现父类的初始化，也就是向上代理，便利构造函数必须宗师调用同一个类的构造函数(self.init())，即横向代理
//6.3.1构造函数的调用规则
class PersonK{
    var name:String
    var age:Int
    func description(){
        print("他的名字是\(name)，今年\(age)岁了")
    }
    //指定构造函数
    init(name:String,age:Int) {
        self.name = name
        self.age = age
    }
    //便利构造函数
    convenience init(name:String){
        self.init(name: name,age:20)
    }
    //便利构造函数
    convenience init(){
        self.init(name: "Jack")
    }
}
class EmployeeK: PersonK {
    var company:String
    //指定构造函数
    init(name:String,age:Int,company:String) {
        self.company = company     //安全检查1
//        self.printInfo()         //安全检查3
        super.init(name: name, age: age)
        self.name = "Tom"
        self.age = 28              //安全检查2
    }
    //指定构造函数
    init(name:String,company:String){
        self.company = company
        super.init(name: name, age: 18)
    }
    //便利构造函数
    convenience override init(name: String, age: Int) {
        self.init(name: name, age: age, company: "Apple")
        self.name = "paul"         //安全检查3
        self.age = 30
    }
    func printInfo() {
        print("构造过程的安全检查")
    }
}
/*
    tips:   1、指定构造函数必须调用父类的制定构造函数
            2、便利构造函数必须调用用一个类中定义的构造函数（包括指定构造函数和便利构造函数）
            3、便利构造函数必须最终导致一个指定构造函数被调用
            4、指定构造函数总是向上代理，便利构造函数总是横向代理
 */

//6.3.2构造过程的安全检查
//swift类中的构造函数过程分为两个阶段
//1、第一阶段，首先分配内存，初始化子类新增的存储属性，然后沿构造函数链网上初始化每个父类的存储属性，到达构造函数链的顶端。此时，父类和子类的所有存储属性都有初始值
//2、第二阶段，从顶部的构造函数链往下，给每一个类一次机会在新实例准备使用之前修改存储属性，调用实例方法
//swift编译器将执行四种有效的安全检查，以确保两段式构造过程能顺利完成
//01安全检查1、指定构造函数必须保证它所在类引入的所有属性都必须先初始化完成，才能将其他构造任务向上代理给父类中的构造函数
//02安全检查2、指定构造函数必须先向上代理调用父类构造函数，然后再为继承的属性设置新值。如果没这么做，指定构造函数赋予的新值将会被父类中的构造函数覆盖
//03安全检查3、便利构造函数必须先代理调用同一类中的其他构造函数，然后再为任意属性赋新值，如果没那么做，便利构造函数赋予的新值将会被同一类中其他指定构造函数覆盖
//04安全检查4、构造函数在第一阶段构造完成之前，不能调用任何方法，不能读取任何实例属性的值，不能引用self作为一个值

//6.3.3构造函数的自动继承
//与OC中的子类不同，默认情况下，swift中的子类并不会继承父类的构造函数。swift的这种机制可以防止一个父类的简单构造函数被一个更专业的子类继承，并被错误的用来创建子类的实例。但是如果满足特定条件，父类构造函数式可以自动继承的。此时，不必在子类中重写父类的构造函数，并且可以在保证安全的情况下，以最小的代价继承父类的构造函数。
//子类对父类的构造函数的自动继承有两个规则
//1、规则1：如果子类中定义的所有新属性都有默认值，而且子类没有自定义任何指定构造函数，那么子类将自动继承父类的所有指定构造函数
//2、规则2、如果子类提供了所有父类指定构造函数的实现，无论是 通过规则1继承来的，还是提供了自定义实现，它将自动继承所有度类的便利构造函数（即使属性没有默认值，只要实现了父类的所有指定构造函数，就会自动继承父类的所有便利构造函数）。而且子类可以讲话父类的指定构造函数实现为便利构造函数

//6.3.4 构造函数的重写
//在默认的起情况下子类并不会继承父类的构造函数，所以需要对父类的构造函数进行重写。swift的这种机制可以保证在构造函数里将类的所有属性都初始化，能够防止一个父类的简单构造函数被一个具有新信息的子类继承，并被错误地用来创建子类的实例。重写时注意加上override修饰符。和重写属性、方法、或者下标脚本一样，override修饰符会让编译器去检查父类中是否有相匹配的指定构造函数，并验证构造函数是否正确
//如果子类的构造函数和父类的便利构造函数相匹配，由于子类不能直接调用父类的便利构造函数，因此，严格意义上讲，子类并未对父类构造函数提供重写。所以，在子类中定义一个与父类的便利构造函数匹配的构造函数时，不需要加override前缀。
/*
    tip:  子类不能修改父类的常量属性
 */

//6.4 封装和多态
//6.4.1 封装
//通常把隐藏属性、方法与实现细节的过程称为封装，主要包括两个方面，1、隐藏类的属性和方法，2、隐藏方法的实现细节
//01隐藏属性和方法
//常用的控制符
//public   : 从外部模块和本模块都能访问
//internal : 只有本模块能访问
//private  :只有本文件可以访问，本模块内的其他文件不能访问
//例子
public class StudentP{
    public var name:String
    internal var age:Int
    private var score:Int
    init(name:String,age:Int,score:Int) {
        self.name = name
        self.age = age
        self.score = score
    }
    public func sayHello(){
        print("hello everyone,my name is \(self.name),nice to meet you")
    }
}
/*
    tip:没有显示声明访问控制字符，系统默认都使用internal控制符
 */
//6.4.2 多态
//在swift中，多态是指允许使用一个父类类型的变量或者常量来引用一个子类类型的对象，根据被引用子类对象的特征的不同，得到不同的运行结果。即使用父类的类型来调用子类的方法。多态把不同的子类对象都当作父类来看，可以屏蔽不同子类对象之间的差异。赋值之后，父类类型的对象就可以根据当前赋值给它的字对象的特性以不同的方式运作，也就是，父亲的行为像儿子，而不是儿子的行为像父亲。多态在继承的基础上实现的。
class AAnimal {
    func shout(){
        print("动物发出了叫声")
    }
}
class AACat: AAnimal {
    override func shout() {
        print("🐱发出了叫声")
    }
}
class AADog: AAnimal {
    override func shout() {
        print("🐶发出了叫声")
    }
}

let animalA:AAnimal = AACat()
let animalB:AAnimal = AADog()
animalA.shout()
animalB.shout()

//6.5可选链
//可选链式调用是一种可以在当前值可能为nil的可选值上请求和调用属性、方法、及其下标的方法。如果可选值有值，那么调用会成功，如果可选值为nil，那么调用将返回nil。多个调用可以连接在一起形成一个调用链，如果其中任何一个节点为nil，整个调用链都会失败，返回nil。

//可选链（？）和可选值强制展开（！）的区别在于，当可选值为空时，可选链只会调用失败，而强制展开只会触发运行时错误
class PersonD{
    var residence:Residence?
}
class Residence{
    var numberOfRooms = 2
}

let tom = PersonD()
//let roomCount = tom.residence!.numberOfRooms //会报错
let roomCount = tom.residence?.numberOfRooms

//6.5.2 可选链访问属性、方法、下标
//例子
class PersonY{
    var residences:ResidenceA?
    
}
class Room{
    let name:String
    init(name:String) {
        self.name = name
    }
}
class Address{
    var buildingName:String?
    var buildingNum:Int?
    var street:String?
    func huildingIdentifier() ->String? {
        if buildingName != nil  {
            return buildingName
        } else if buildingNum != nil && street != nil {
            return "\(String(describing: buildingNum))\(String(describing: street))"
        } else {
            return nil
        }
    }
}

class ResidenceA{
    var rooms = [Room]()
    var numberOfRooms:Int{
        return rooms.count
    }
    subscript(i:Int)->Room{
        get{
            return rooms[i]
        }
        set{
            rooms[i] = newValue
        }
    }
    func printNumberOfRooms(){
        print("一共有\(numberOfRooms)个房间")
    }
    
    var address:Address?
}
//01可选链访问属性
//可选链获取属性的值
let Jack = PersonY()
Jack.residences = ResidenceA()
if let roomCount = Jack.residences?.numberOfRooms{
    print("Jack的住所一个有\(roomCount)间房子")
} else {
    print("无法获取房间数")
}
//可选链设置属性的值
func createAddress()->Address{
    print("方法被调用了")
    let someAdress = Address()
    someAdress.street = "建业路"
    someAdress.buildingNum = 10
    return someAdress
}
let JackM = PersonY()
JackM.residences?.address = createAddress()
//let resL:Int = (JackM.residences?.address?.buildingNum)!
print(JackM.residences?.address?.buildingNum)
//可选链调用方法
let JackL = PersonY()
JackL.residences = ResidenceA()
if JackL.residences?.printNumberOfRooms() != nil {
    print("打印成功")
} else {
    print("打印失败")
}
//03可选链访问下标脚本
let Jay = PersonY()
let JayHouse = ResidenceA()
JayHouse.rooms.append(Room(name:"客厅"))
JayHouse.rooms.append(Room(name:"厨房"))
Jay.residences = JayHouse
Jay.residences?[0] = Room(name:"卧室")
if let firstroom = Jay.residences?[0].name{
    print("第一个房间是\(firstroom)")
} else {
    print("无法获取第一个房间")
}
/*
    tips:多层可选链的返回值
    可以使用多层可选链在更深的模型层级中访问属性、方法及下标。然而，多层可选链不会增加返回值的可选层级，也就是说，多选可选链返回值仍然是一层可选
    例如：通过可选链访问一个Int值，不论可选链有多少层，都会返回Int？；通过可选链访问Int？值，依旧会返回Int？，而不是Int？？
 */

//6.6类型检查和转换
//在类和子类的层次结构里，可以使用类型检查来判断一个对象的真实类型，也可以将一个对象转换为层次结构总的其他类型。
class PersonT{
    var name:String?
    init(name:String) {
        self.name = name
    }
}
class EmployeeT: PersonT {
    var company:String?
    init(name:String,company:String) {
        self.company = company
        super.init(name: name)
    }
}
class StudentT: PersonT {
    var school:String?
    init(name:String,school:String) {
        self.school = school
        super.init(name: name)
    }
}
//6.6.1 类型检查（is操作符）
let employeeA = EmployeeT(name:"locus",company:"ali")
let employeeB = EmployeeT(name:"Jan",company:"tencent")
let studentC = StudentT(name:"sara",school:"浙江大学")
let numbers = [employeeA,employeeB,studentC]
var employeeCount:Int = 0,studentCount:Int = 0

for item in numbers{
    if item is EmployeeT {
        employeeCount += 1
    } else {
        studentCount += 1
    }
}
print("员工数\(employeeCount),学生数:\(studentCount)")

//6.6.2 类型转换 (as 操作符)
//类型转换操作符有两种形式 as! as?  子类支持向上或者向下转型。

for item in numbers{
    if let employee = item as? EmployeeT{
        print("公司员工\(item)")
    } else if let student = item as? StudentT{
        print("学校学生\(student)")
    }
}
/*
    tip: 类型转换并没有真的改变对象和它的值，对象的本身不变，只是将它转换成不同的类型使用
 */
//6.6.3 Any 和 AnyObject的类型转换
//swift提供了两种类型来表示不确定类型Any 和 AnyObject，AnyObject表示任何类型的实例；Any可以表示任何类型，包括类、函数、Int、和double等基础类型等；AnyObject经常用于数组和字典。
let emp1 = EmployeeT(name:"keke",company:"apple公司")
let emp2 = EmployeeT(name:"haha",company:"传播智客")
let members:[AnyObject] = [emp1,emp2]
for item in members{
    let employeess = item as! EmployeeT
    print("员工公司\(employeess)")
}
//对整个数组进行转换
for item in members as! [EmployeeT]{
    print("员工公司\(item)")
}
//any类型,使用该类型可以将不同的类型混合起来工作
//例子
var things = [Any]()
things.append(12)
things.append("hello")
things.append((3,5))
things.append(EmployeeT(name:"lee",company:"dahua"))
things.append({(name:String)->String in "hi,\(name)"})
for thing in things{
    switch thing{
    case let someInt as Int:
            print("整数:\(someInt)")
    case let someString as String:
            print("字符串:\(someString)")
    case let (x,y) as (Int,Int):
            print("元组类型:\(x,y)")
    case let emp as EmployeeT:
            print("员工名称\(String(describing: emp.name))员工公司\(String(describing: emp.company))")
    case let stringConverter as(String)->String:
            print(stringConverter("Tim"))
    default:
        print("其他")
    }
}

//6.7嵌套类型
//swift允许在一个类型中潜逃定义另一个类型，即潜逃类型。可以在枚举类型、类、结构体中定义支持嵌套的类型，定义时，将需要嵌套的类型写在被嵌套类型的大括号内部
//例如
struct Car{
    var brand:String?
    var color:Color
    enum Color {
        case Red,Black,White,Orange
    }
}
let car = Car(brand:"奔驰",color:Car.Color.Black)
print(car.color)


































