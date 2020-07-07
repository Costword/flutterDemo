import 'package:flutter/material.dart';


///statefulWidget的生命周期可以分为三类
///1 初始期 creatState initState
///creatState 必须被重写
///initState 加载完成后调用 是创建widget时调用的除了构造方法之外的第一个方法
///类似于ios中的viewDidLoad 一般做一些初始化工作，如channel的初始化 监听器的初始化
///2 更新期 didchangeDependencies  build  didUpdateWidget
///didchangeDependencies 当依赖的state对象呗改变的时候调用
///a。在第一次构造widget时，在initstate方法被调用后立即调用此方法
///b。如果statefulWidget依赖于InheriteWidget 那么当state所以来的Inheritewidget中的
///变量改变的时候也会再次调用它
///build 这是一个必须实现的方法 在这里实现你想要呈现的内容
/// 他会在didchangeDependencies方法之后立即调用
/// 改变setstate后也会再次调用该方法
/// 3 销毁方法
/// deactivate  dispose
/// deactivate 很少使用 在组件被移除的时候调用 在dispose之前
/// dispose 比较常用 组件被销毁的时候调用
/// 通常在该方法执行游戏额资源的释放 比如，监听器的卸载，channel的销毁
class lifeStatePage extends StatefulWidget {
  @override
  _lifeStatePageState createState() => _lifeStatePageState();
}

class _lifeStatePageState extends State<lifeStatePage> {
  int currentClickNum = 0;
  @override
  void initState() {
    // TODO: implement initState
    print('初始化---initState');
    super.initState();
  }
  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    print('更新widget---didChangeDependencies');
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    print('更新widget---bulid');
    return MaterialApp(
      theme: ThemeData(
          primarySwatch: Colors.blue,
      ),
      home: Scaffold(
          appBar: AppBar(
            title: Text('flutter中statefulWidget的生命周期'),
            leading:
            GestureDetector(
              child: Icon(Icons.arrow_back),
              onTap: (){
                Navigator.pop(context);
              },
            ),
          ),
        body: Center(
          child: Column(
            children: <Widget>[
              RaisedButton(
                onPressed: (){
                  setState(() {
                    currentClickNum++;
                  });
              },
                child: Text('点我'),
                textColor: Colors.red,
              ),
              Text('点了$currentClickNum 下'),
            ],
          ),
        ),
      ),
    );
  }
  ///这不是一个常用的生命周期方法，当父组件需要重新绘制的时候才会调用
  ///该方法会携带一个oldWidget参数 可以将其与当前的widget进行对比以便执行一些额外逻辑
  ///if(oldWidget.xxx != widget.xxx)
  @override
  void didUpdateWidget(lifeStatePage oldWidget) {
    // TODO: implement didUpdateWidget
    print('更新---didUpdateWidget');
    super.didUpdateWidget(oldWidget);
  }
  @override
  void deactivate() {
    // TODO: implement deactivate
    print('销毁---deactivate');
    super.deactivate();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    print('销毁---dispose');
    super.dispose();
  }
}
