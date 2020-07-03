//构造方法演示
//所有的类都继承自Object
class person{
  String name;
  int age;
  //类的构造方法，用于初始化属性
  person(this.name,this.age);
  //重载方法 重写父类方法
  @override
  String toString() {
    return 'name:$name, age:$age';
  }
}

//继承
class student extends person{
  //构造方法
  String _school;//变量前带‘_’的代表是私有变量
  String city;
  String country;
  String name;
  //初始化自身变量可以在构造方法中this.变量名  {}里面的参数代表可选参数 默认参数用=赋值
  //构造方法：后面成为初始化列表  作用：除了调用父类构造器之外，在子类构造方法之前我们可以初始化实例变量 不同的变量可以用','隔开
  student(this._school,String name, int age,{this.city, this.country ='china'})
      :
      name = '$name',
        super(name, age){
    //构造方法后{}称作构造方法体，可以在此做一些操作，构造方法体可有可无
    print('初始化student类，构造方法体打印');
  }

  @override
  String toString(){
    return 'name:$name, school:${this._school},age:$age';
  }
  String get school => _school;
  set school(String str){
    _school = str;
  }
  //命名构造方法 为类实现多个构造方法
  student.cover(student stu):super(stu.name,stu.age);
  static doPrint(String str){
    print("doPrint:$str");
  }
}

//工厂构造方法 又称为单例模式

class Logger{
  static Logger _cache;
  factory Logger(){
    if(_cache == null) {
      _cache = Logger._internal();
    }
    return _cache;
  }
  Logger._internal();
  void log(String message){
   print('message');
  }
}

