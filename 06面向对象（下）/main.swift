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
























