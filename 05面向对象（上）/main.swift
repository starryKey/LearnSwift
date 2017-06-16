//
//  main.swift
//  05面向对象（上）
//
//  Created by Li_JinLin on 2017/6/15.
//  Copyright © 2017年 Li_JinLin. All rights reserved.
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
if (per33 === per31){
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
/*
   tip: 1、全局变量和局部变量，计算属性和属性观察器，它们所描述的模式也是可以用于全局变量和局部变量，所谓的全局变量是在函数、方法、闭包或者任何类型之外定义的变量，局部碧娜领是在函数、方法或者闭包内部定义的变量
        全局变量和局部变量都属于存储型类型，跟存储属性类似，它提供特定类型的存储空间，并允许读取和写入。
        2、全局的常量或者变量都是延迟计算的，跟延迟属性类似，不同的地方在于，全局变量或者常量不需要标记lazy特征；局部范围的常量或者变量不会延迟计算
*/
//例 （使用时，注意变量的作用域）
let str1 = "Swift"       //属于全局变量
class PersonC {
    let str2 = "OC"      //属于类局部变量
    func printString(){
        let str3 = "C++" //函数局部变量
        print(str3)
    }
}

//5.3.5 属性观察器
//应用场景：假设有一个Student类，它有三个属性，分别是livingcost(生活费),tuition(学费)和name(姓名)。在这个类中，由于不同的人的生活费不一定相同，因此livingcost(生活费)和name(姓名)是不同的，但是所有人的tuition(学费)是相同的。tuition属性与个体无关，不需要对类进行实例化就可以使用，这种属性被称为类型属性。类型属性使用关键字static来定义的，结构体、枚举和类都是可以定义类型属性的，
//例
//01结构体类型属性的语法格式
//struct 结构体名{
//    static var 存储属性 = "XXX"
//    static var 计算属性名 ：属性数据类型 {
//        return 计算后属性值
//    }
//}
//例子
struct StudentM {
    var livingCost = 0.0
    var owner:String = ""
    static var tuition:Double = 10000
    static var tuitionProp:Double {
        return tuition + 100
    }
    
    var totalCost:Double{
        return StudentM.tuition + livingCost
    }
}
//访问静态属性
print(StudentM.tuitionProp)//静态属性直接用类型名称进行访问
var aStu = StudentM()
//访问实例属性
aStu.livingCost = 1_1000
print("访问实例属性\(aStu.totalCost)")

//02枚举类型属性的语法格式
//enum 枚举名 {
//    static var 存储属性 = "XXX"
//    static var 计算属性名 : 属性数据类型 {
//        return 计算后属性值
//    }
//}
//例子
enum StudentE {
    case iOS
    case Jave
    case PHP
    case JS
    //存储属性
    static var tuition:Double = 10000
    //计算属性
    static var tuitionProp:Double{
        return tuition
    }
    //计算属性
    var instanceProp:Double{
        switch (self) {
        case .iOS:
            StudentE.tuition = 10000
        case .Jave:
            StudentE.tuition = 10001
        case .PHP:
            StudentE.tuition = 10002
        case .JS:
            StudentE.tuition = 10003
        }
        return StudentE.tuition + 1_000
    }
}
//访问静态属性
print("枚举类型属性访问静态属性：\(StudentE.tuition)")
//访问实例属性
var aStudent = StudentE.iOS
print("枚举类型属性访问实例属性：\(aStudent.instanceProp)")

//03类类型属性的语法格式
//class 类名{
//    static var 存储属性 = "XXX"
//    static var 计算属性名 : 属性数据类型 {
//        return 计算后属性值
//    }
//    class var 子类对父类实现支持重写：属性数据类型 {
//        return 重写后属性值
//    }
//}
/*  
    tip : 在为类定义类型属性时，可以使用关键字class来替换static关键字
 */
//例
class StudentF {

    var livingcost:Double = 0.0
    var name:String = ""
    static var tuition:Double = 10000
    static var tuitionProp:Double{
        return tuition
    }
    var totalCost:Double{
        return StudentF.tuition + livingcost
    }
}
//访问静态属性
print(StudentF.tuition)
//访问实例属性
var stuF = StudentF()
stuF.livingcost = 1_000
print("类型属性属性访问静态属性：\(stuF.totalCost)")

//5.4 方法 （swift中，方法可以在类、结构体、枚举中定义，分为实例方法和类方式）
//5.4.1 实例方法（由类的特定实例调用，实例方法和函数一样分为有参和无参方法）
//例
class Weather {
    func printWeather(){
        print("现在是夏天")
    }
    class func summer(){
        print("天气很热")
    }
}
let weather = Weather()
//实例方法
weather.printWeather()
//类型方法
Weather.summer()

//5.4.2类型方法：类型（类、结构体、枚举）自身调用的方法，如果在类、结构体、枚举中定义类型方法时，需要在func关键字前面加上static关键字声明，而在类中的类型方法，可以使用class关键字替换static
//结构体和枚举类型方法
struct PerE {
    //定义结构体类型方法
    static func personName(name:String){
        print("结构体类型方法\(name)")
    }
}
PerE.personName(name:"Jack")

enum Animal {
    case dog
    case cat
    case mouse
    //定义枚举类型方法
    static func printAnimals(){
        print("枚举类型方法")
    }
}
var dog = Animal.dog
print(dog)
Animal.printAnimals()

//5.5 构造函数
//构造函数是一种特殊的函数，主要是用来创建对象时，初始化对象，为对象的属性设置初始值。在swift中所有的构造函数都是init方法，并且支持构造函数重载。

//5.5.1构造函数基础
//swift在实例化之后，所有的存储型属性必须有值，可使用1、在定义属性时赋初始值2、将属性设置为Optional
class Per1{
    var name = "KK"
    var age = 10
}
class Per {
    var name:String?
    var age : Int?
}
var p = Per()
p.name = "Tom"
p.age = 20
print("姓名：\(p.name!) 年龄\(p.age!)")
//如果不强制解包，打印的结果会带有Optional。如果不想强制解包，且属性有默认值，可以使用系统默认提供的init构造函数，在类的实例化过程中，给存储型属性设置指定的值。实例化后直接拿来使用，或者在类实例化时指定存储属性的值。
//例 使用init初始化函数
class Employee1:NSObject {
    var name:String
    var age :Int
    //重写morning的构造函数
    //父类提供了只跟函数，而子类需要对父类的函数进行扩展，叫做重写
    //特点：可以super.XXX调用父类本身的方法
    override init() {
        name = "Pual"
        age  = 24
        super.init()
    }
}
let employee = Employee1()
print("使用init初始化函数,姓名:\(employee.name) 年龄:\(employee.age)")

//5.5.2重载构造函数
//在一个类中可以定义多个构造函数，以便提供不同的初始化方法，这些构造函数具有相同的名字，而参数的个数、名称、类型不相同，这称为构造函数的重载
class HHHH{

    var name:String
    var age:Int
    init(name:String,age:Int) {
        self.name = name
        self.age = age
    }
    func printInfo() {
        print("重载构造函数\(self.name),\(self.age)")
    }
}

var hh = HHHH(name:"tom",age:18)
hh.printInfo()

//5.5.3指定构造函数与便利构造函数
//在构造函数中可以使用构造函数代理帮助完成部分构造工作。类构造函数代理分为横向代理和向上代理，向上代理发生在继承的情况下，在子类构造过程中，要先调用父类构造函数初适化的父类的存储属性，这种构造函数称为指定构造函数。横向代理只能发生在同一类内部，这种构造函数称为便利构造函数。
//01指定构造函数
//指定构造函数是类中最主要的构造函数。一个指定构造函数将初始化类中提供的所有属性，并根据继承链往上调用父类的构造函数来实现父类的初始化
//格式
//init(参数){
//    //声明
//}
//指定构造函数将在继承中阐述
//02便利构造函数，该函数是类中比较次要的、辅助型的构造函数。可以定义便利构造函数来调用同一个类中的指定构造函数，并为其参数提供默认值。也可以定义便利构造器来创建一个特殊用途或特定输入值的实例
//convenience init(参数){
//    声明
//}
//便利构造函数的特点
/*
    1、只有便利构造函数中可以调用self.init()
    2、便利构造函数不能被重写或者使用super调用父类的构造函数
    3、不能被继承
 */
//例
class PersonM {
    var name:String
    init(name:String) {
        self.name = name
    }
    convenience init() {
        self.init(name: "UnName")
    }
}
let m1 = PersonM(name:"alis")
let m2 = PersonM()
print(m1.name)
print(m2.name)

//5.6 析构函数
//析构函数与构造函数相反，在一个类的实例被释放之前，析构函数会被调用。析构函数用关键字deinit来定义，析构函数没有返回值，也没有参数，不需要参数的小括号，所以不能重载，每个类最多只能有一个析构函数
//deinit{
////    执行析构过程
//}
//例
class Circle{
    let x = 3.1415926
    var r:Double
    init(r:Double) {
        self.r = r
    }
    deinit {
        print("调用析构函数")
    }
}
var circle = Circle(r:3)
print("圆的面积是\(circle.x * circle.r * circle.r)")
//circle = nil  //circle释放内存
var circle1 = Circle(r:10)
print("圆的面积是\(circle1.x * circle1.r * circle1.r)")
/*
    tip: 在swift中，析构函数只适用于类，不能适用于枚举和结构体。由于swift采用自动引用计数机制（ARC）管理内存，因此通常当实例被释放的时候，不需要手动去清理
*/

//5.7 下标脚本
//下标脚本是访问对象、集合或者序列的快速方式。开发者不需要调用实例特定的赋值和访问语法，就可以直接访问所需要的数值，例如数组perArray[index]、字典perDictionary[key]都使用了下标脚本
//5.7.1 下标脚本语法(类似于实例方法和计算型属性的混合，与定义实例方法类似，下标脚本使用subscript关键字定义)
//形式
//subscript(参数名称1：数据类型1,参数类型2：数据类型2,...)->返回值的参数类型{
//    get {
//        //返回与参数类型匹配的类型的值
//    }
//    set(参数名称) {
//        //执行赋值操作
//    }
//}
//在上述的格式中，get为读取方法，set为设置方法。在定义set时，传入的参数类型必须。与计算属性中的set方法相同，set后面如果没有声明参数，那么就是用默认的newValue
//例
class NumberOfPeople{
    var principalNumber:Int = 0
    var teacherNumber:Int = 0
    var studentNumber:Int = 0
    subscript(index:Int)->Int{
        //设置get方法
        get{
            switch index{
            case 0:
                return principalNumber
            case 1:
                return teacherNumber
            case 2:
                return studentNumber
            default:
                return 0
            }
        }
        set{
            switch index{
            case 0:
                return principalNumber = newValue
            case 1:
                return teacherNumber = newValue
            case 2:
                return studentNumber = newValue
            default:
                return
            }
        }
    }
}
var peopleCount = NumberOfPeople()
peopleCount[0] = 1
peopleCount[1] = 50
peopleCount[2] = 200
var sum:Int = 0
for num in 0...2{
    sum += peopleCount[num]
}
print("总人数:\(sum)")
//使用只读的形式实现使用下标访问属性值的功能
class NumberOfPeopleM{
    var principalNumber:Int = 1
    var teacherNumber:Int = 40
    var studentNumber:Int = 200
    subscript(index:Int)->Int{
        //设置get方法
        get{
            switch index{
            case 0:
                return principalNumber
            case 1:
                return teacherNumber
            case 2:
                return studentNumber
            default:
                return 0
            }
        }
    }
}
var peopleNum = NumberOfPeopleM()
//遍历输出属性
for i in 0...2{
    print(peopleNum[i])
}






















