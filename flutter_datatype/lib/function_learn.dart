
class myFunctionLean{
  //方法 返回值类型 + 方法名+参数
  //返回值可以缺省也可以为viod 或者具体类型
  int sum(int valu1,int valu2){
    return  valu1+ valu2;
  }
}

class sumfunction{
  myFunctionLean mysum = myFunctionLean();
  void start(){
    int he =  mysum.sum(1234, 4321);
    print('加法结果是$he');
  }
}