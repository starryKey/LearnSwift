//
//  main.swift
//  03字符串和集合
//
//  Created by Li_JinLin on 2017/6/14.
//  Copyright © 2017年 www.dahuatech.com. All rights reserved.
//

import Foundation

print("Hello, World!-->字符串和集合")

/********************************************三、字符串和集合*************************************************/
//3.1 字符
//3.1.1字符概述
       //1 、在swift中，字符是字符串的基本组成单位，隶属于Character类型。字符只能是一个字母、数字、汉字或者符号，使用""包裹住；
       //2、字符定义的基本格式: let/var 名称:Character = "值"，let/var用于区分可变不可变
       //3、例: let ch:Character = "A" ,print(ch).使用"" 而不是C语言中的‘’
//3.1.2转义字符
       //1、不能直接使用"\"，因为\比较特殊，为转义字符;
       //2、常见的转义字符, \t : 水平制表符tab ，\n : 换行， \r : 回车   \" : 双引号    \' : 单引号   \\  ：反斜线
/*
    tip:swift语言采用Unicode编码，它的字符几乎涵盖了大家所知道的一切字符，包含图片表情
 */


//3.2字符串
//3.2.1初始化字符串
//1、通过字面量赋值的方式初始化字符串
let testStr = "this is a test string"
print(testStr)
//2、通过创建String实例的方法初始化字符串
let testStr2 = String()
print("--\(testStr2)")
//通过构造函数String创建，打印的结构为空字符串，说明通过String创建的字符串是一个空字符串 String提供一个isEmpty属性，用于判断字符串是否为空
//例如：
    //if testStr2.isEmpty {
    //}
//3.2.2字符串的基本操作
    //01字符串的长度//汉字一个字占三个字节
    let str = "helloworld"
    let length = str.lengthOfBytes(using: String.Encoding.utf8)
    let length2 = str.characters.count
    print("以字节为单位的字符串的长度：\(length)字符数\(length2)")
    //02字符串的遍历
    for cStr in str.characters{
        print(cStr)
    }
    //03连接字符串和字符
    var varStr = "www."
    varStr += "dahuatech.com"
    print(varStr)

    var string1 = "hello"
    var string2 = "world"
    var string3 = string1 + string2
    print(string3)
    //04字符串插值
    var string4 = "字符串的插入\(string2)+\(string1)"
    print(string4)
    //格式化字符串
    let hour = 8
    let minute = 5
    let second = 6
    let dataString = String(format:"%02d:%02d:%02d",arguments:[hour,minute,second])
    let dataString2 = String(format:"%02d:%02d:%02d",hour,minute,second)
    print(dataString)
    print(dataString2)
//3.2.3字符串的高级操作
    //01、字符串的截取（swift中的string相较于NSString类而言有些复杂因此转换，）
    let strT = "helloworld"
    //将string转为OC中的NSString字符串使用，并根据范围来截取字符串
    let subStr = (strT as NSString).substring(with: NSMakeRange(1, 3))
    print(subStr)
    //02字符串的比较
    let emptyStr1 = ""
    let emptyStr2 = String()
    if emptyStr1 == emptyStr2 {
        print("两个字符串相等")
    } else {
        print("两个字符串不等")
    }
    //前缀 后缀
    let res1 = string1.lowercased().hasPrefix("he")//前缀
    let res2 = string2.lowercased().hasSuffix("wo")//后缀
    print("前缀有lo:\(res1)后缀有：he:\(res2)")
/*
    tips: 比较NSString 和 String（通常使用 str as NSString 或者 NSString as str来回转换字符串）
    1、String是一个结构体类型，而NSString是一个继承自NSObject基类的对象
    2、两者都可以使用自己的类型来字节进行转化，表面上看是相同的，但是NSString的意思是初始化了一个指针指向了这个字符串，而String是把字符串的字面量赋值给常量或变量
    3、String的字符串拼接比NSString更加方便，直接使用+ 而NSString使用append或者stringWithFormat   
    4、String可以实现遍历输出一个字符串内部的所有字符，而NSString 是做不到的，因为String继承了CollectionType协议
    5、NSString直接是痛length即可的搭配字符串的长度，但是swift真正的类似于length的方法是取出characters属性获得字符集和，然后使用 count属性计算
 */
//3.3集合Collection
    //swift提供了数组、Set和字典三种集合类型，用于存储集合数据，数组是按照顺序来存储相同类型的数据，Set使用来无序存储相同类型的数据，字典是用键值对的形式无序存储相同饿类型的数据
//3.3.1 Array
        //01创建数组（定义数组的两种形式 var array1: Array<String>   var array2: [String]）
         //方式01 var someInts = [Int]()
         //方式02
            let array3:[String] = ["str1","str2"]
            let array4 = ["changsan",18] as [Any] //根据字面语句推导后得知是存放NSObject类型的，而数字可以直接添加到数组中，而不用封装成NSNumber
            print("\(array3) + \(array4)")
         //方式03
            let array6 = ["string3"]
            let array5 = array3 + array6
            print(array5)
        //02数组的常见操作方式与OC类似，不再举例说明
/*
    tips:
    （1）、数组的内存优化：如果向数组内追加元素，超过了数组原有的容量，系统会自动分配最合适的容量，以容纳新元素的添加
     var array7:[String]
     //分配空间
     array7 = [String]()
     for value in 0...8{
     array7.append("testStr\(value)")
     print(array7[value] + "--容量\(array7.capacity)")
     print(array7[value] + "--元素个数\(array7.count)")
     }
    （2）、比较swift和OC的数组
        1、OC中有NSArray NSMutableArray之分，而swift中以let和var区分是否可变
        2、swift中的数组是类型安全的，所以在某个元素添加到数组之前类型都必须明确，只能添加相同类型的元素。这是OC和swift的一个重要的区别
        3、swift数组可以直接通过 += 来直接添加拥有相同类型的数组
        4、swift和OC的数组索引都是从0开始，并且可以通过索引号来获取对应的值
 */
//3.3.2 Set Sorted（）函数待理解
//说明：Set使用来存储类型相同并且没有确定顺序的值，与数组不同的是，Set里的元素是无序的，而且每个元素都不能重复
//基本格式：Set<Element>
      //创建Set
           //01创建空Set  var letters = Set<Character>()
           //02用数组字面量创建
              var colors:Set<String> = ["Red","Green","Cyan"]//由于Set不能自动推断出来，所以必须声明
              var colors2:Set =  ["Red","Green","Cyan"]   //元素类型相同，自动推断为<String>
           //03访问和修改Set
            let nCount = colors.count
            print(nCount)
            //增删改查
            colors.insert("Orange")
            if let removeRed = colors.remove("Red"){
                print("包含红色，现在删除")
            } else {
                print("不包含红色，没法删除")
            }
           //检查是否包含
            if colors.contains("Green"){
                print("包含绿色")
            } else {
                print("不包含绿色")
            }
           //删除所有
            colors2.removeAll()
            //04遍历
            var colors3:Set<String> = ["Red","Green","Cyan"]
            for color in colors3{
                print(color)
            }
            print("无序的")
            print(colors3)

            for color in colors3.sorted(){
                print(color)
            }
            print("有序的")
            print(colors3)
            //04Set之间的操作
            var setA:Set<Int> = [1,2,3,4,5,6]
            var setB:Set<Int> = [4,5,6,7,8,9]
            print("intersection方法：取集合公共的部分",setA.intersection(setB).sorted())//4,5,6
            print("symmetricDifference方法：取没有交集的部分",setA.symmetricDifference(setB).sorted())//1,2,3,7,8,9
            print("union方法：取两者全部的",setA.union(setB).sorted())//1~9
            print("subtracting方法，取A中不含B的部分",setA.subtracting(setB).sorted())//1,2,3
            //05 Set之间的关系（指Set的元素之间的关系，如果一个Set包含了另一个Set的所有元素，通常称前一个Set是后一个Set的父Set）
            let Set1:Set<Int> = [1,2,3,4,5]
            let Set2:Set<Int> = [1,2]
            let Set3:Set<Int> = [4,5,6,7,8]
            let Set4:Set<Int> = [1,2]
            print("Set2是Set1的子集",Set2.isSubset(of: Set1))
            print("Set1是Set2的父集",Set1.isSuperset(of: Set2))
            print("Set2和Set3没有交集",Set2.isDisjoint(with: Set3))
            print("Set2和Set4相等",Set2 == Set4)
//3.3.3  Dictionary
//字典是一种存储相同数据类型多重数据的存储器，每个值都有关联着的独特的键，字典中的数据没有具体的顺序
//01定义格式
//let/var  名称：Dictionary = [key1:value1,key2:value2,key3:value3] ,Dictionary<String,String> = [key1:value1,key2:value2,key3:value3]
//02增加和替换
var dict:Dictionary = ["name":"Jack","age":18,"height":180] as [String : Any]
dict["name"] = "Tom"
dict["height"] = 178
print("字典",dict)
//03字典的遍历
var dict2:Dictionary = ["name":"Jack","age":18,"height":180] as [String : Any]
for(k,v) in dict2{
    print("字典key:\(k): value:\(v)")
}
//04字典的合并
var dic1 = ["name":"rose","age":18] as [String : Any]
let dic2 = ["height":168]
for (k,v) in dict2{
    dic1[k] = v
}
print("字典合并\(dic1)")
/*
    tips:  比较swift和OC中的字典
        1、OC中使用{},而swift中使用[]
        2、OC中有NSDictionary NSMutableDictionary之分，swift中使用let var区分
        3、与OC的字典不同，swift的字典不仅可以存储对象类型的值，还可以存储基本数据类型，结构体、枚举值
        4、OC中字典是继承自NSObject基类的对象，而swift中低端字典是一个结构体
 */



