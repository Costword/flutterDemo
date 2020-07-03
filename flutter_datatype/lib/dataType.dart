//import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class myDataType extends StatefulWidget {
  @override
  _myDataTypeState createState() => _myDataTypeState();
}

class _myDataTypeState extends State<myDataType> {
  @override
  Widget build(BuildContext context) {
    _numType();
    stingType();
    boolType();
    listType();
    myMapType();
    return Container();
  }
}

void _numType() {

  num num1 = -1.0; //num 有两个子类 double 和 int 可以直接使用num直接创建这两种类型
  num num2 = 2;
  int numint = 3;
  double numdouble = 4.1;
  int numtoint= numdouble.toInt();
  double numtodouble= numint.toDouble();
  double abs = num1.abs();
  print("num1:$num1---num2:$num2---numint:$numint---numdouble:$numdouble");
  print("double->int:$numtoint");
  print("int->double:$numtodouble");
  print("求绝对值:$abs");
}
void stingType(){
  String str1 = '我是一个字符串',str2 = "双引号也是可以的噢";
  String str3 = 'str1:$str1  str2:$str2';
  String str4 = 'str1'+ str1 + 'str2'+str2;
  print(str3.substring(1,5));//截取字符串从1到5
  print(str4.indexOf("一个"));//获取指定字符串的位置
}

void boolType(){
  //dart bool 类型是强类型 只有bool的值是true才被认定为true
  bool success = true,fail = false;
  print(success);
  print(fail);
  print(success || fail);//打印ture
  print(success && fail);//打印false
}

void listType(){
  print("____________________listType____________________");
  List mylist = [1,'2','love'];//泛型
  List <int>strongList = [1,2,3];//只能存数字，其他类型会报错
  List list3 = [];
  list3.add("list3");
  list3.addAll(mylist);
  List list4 = List.generate(3, (index)=>index*2);//集合生成函数

  //遍历集合
  for(int i=0;i<list4.length;i++) {
    int current = list4[i];
    print("遍历list4第:$i 个是:$current");
  }

  for(var current in list4){
    print("第二种遍历是:$current");
  }

  list4.forEach((current){
    print("第三种遍历方式：$current");
  });
}
void myMapType(){
  //字典的各种方法
  print("__________________________________字典类型————————————————————————————");
  Map mydic = {"name":"王小明","age":"27","sex":"boy"};
  Map names = {};
  names["name1"] = "王小明";
  names["name2"] = "王小红";
  print("我的字典内容是:$mydic");
  print("设置字典内容是:$names");
  //map的遍历方式
  mydic.forEach((k,v){
    print("遍历字典key：$k value:$v");
  });

  Map backDic = mydic.map((k,v){
    return MapEntry(v,k);
  });
  print("第二种遍历字典方法：反转；$backDic");

  for(var key in mydic.keys){
    //遍历字典的key
    print("第三种遍历方法key:$key value:${mydic[key]}");
  }
}

void tips(){
  //科普小知识 dynamic , var , Object三者区别
  //dynamic 动态数据类型 在编译的时候不必定义数据类型，在运行时才知道数据类型
  dynamic X  = "sting";
  print("数据类型是：${X.runtimeType} 值是:$X");

  //var 是指定数据类型 一旦创建数据类型不可修改
  var name = "wang";
  print(name.runtimeType);

  //Object 数据类型是确切的 定义类可以调用Object的方法 例如tosting等
  Object  o1 = "111";
  print(o1.runtimeType);
}

