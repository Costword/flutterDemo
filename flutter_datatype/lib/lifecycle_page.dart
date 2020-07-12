#import 'package:flutter/material.dart';

/// flutter widget的生命周期 statefulWidget
/// statefulWidget 的生命周期可以分为三组
/// 1初始生命周期
/// creatState initState
/// 2更新生命周期
/// didChangeDependencises ,build,didUpdateWidget
/// 3 销毁生命周期
/// deactivate,dispose
///
class flutterLifeCycle extends StatefulWidget {
  @override
  _flutterLifeCycleState createState() => _flutterLifeCycleState();
}

class _flutterLifeCycleState extends State<flutterLifeCycle> {
  ///这是创建statefulWidget后调用的第一个方法
  ///相当于ios的viewDidLoad
  ///这个方法通常会做一些初始化工作，比如channel的初始化，监听器的初始化
  @override
  void initState() {
    // TODO: implement initState

    print('---------initState----------');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
