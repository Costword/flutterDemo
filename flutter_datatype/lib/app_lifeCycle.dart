import 'package:flutter/material.dart';

///获取flutter应用维度生命周期
///widgetsBindingObserver 是一个widget绑定观察器，通过它我们可以监听应用的生命周期
class appLifePage extends StatefulWidget {
  @override
  _appLifePageState createState() => _appLifePageState();
}

class _appLifePageState extends State<appLifePage> with WidgetsBindingObserver {

  @override
  void initState() {
    // TODO: implement initState
    //添加当前widget到WidgetsBinding监听器
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        title: Text('flutter应用的生命周期'),
        leading: BackButton(),
      ),
      body: Container(
        decoration: BoxDecoration(color: Colors.white),
        child: Text('flutter应用的生命周期'),
      ),
    );
  }
  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    // TODO: implement didChangeAppLifecycleState
    //app 生命周期发生变化会调用此方法
    super.didChangeAppLifecycleState(state);
    print('state = $state');
    if(state == AppLifecycleState.paused)
    {
      print('app进入后台');
    }else if (state == AppLifecycleState.resumed)
    {
      print('app进入前台');
    }else if(state == AppLifecycleState.inactive)
    {
      print('app处于非活动状态，并且未接受用户输入是调用，比如来了个电话');
    }
  }
  @override
  void dispose() {
    // TODO: implement dispose
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
    //释放监听
  }
}
