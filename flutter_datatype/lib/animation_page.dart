import 'dart:ffi';

import 'package:flutter/material.dart';

class animationPage extends StatefulWidget {
  @override
  _animationPageState createState() => _animationPageState();
}

class AnimationLogo extends AnimatedWidget{
  AnimationLogo({Key key, Animation<double> animation}): super(key : key,listenable:animation);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    final Animation<double> animation = listenable;
    return Center(
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 10),
        height: animation.value,
        width: animation.value,
        child: FlutterLogo(),
      ),
    );
  }
}

class iconLogo extends StatelessWidget {

  Widget build(BuildContext context) =>Container(
    child: FlutterLogo(),
  );
}

class GrowTransition extends StatelessWidget {
  GrowTransition({this.child ,this.animation});
  final Widget child;
  final Animation<double> animation;
  @override
  Widget build(BuildContext context) => Center(
    child: AnimatedBuilder(
      animation: animation,
        builder: (context , child)=> Container(
          height: animation.value,
          width: animation.value,
          child: child,
        ),
      child: child,
    ),
  );
}



class _animationPageState extends State<animationPage> with SingleTickerProviderStateMixin {
  Animation<double> animation; //动画核心类，用于生成指导动画的值
  AnimationController controller; //Animation的一个子类 用来管理Animation
//  AnimationStatus animationStatus;//Animation的状态，可以获取当前动画的值
//  double animationValue;

  @override
  void initState() {
      // TODO: implement initState
      super.initState();
      controller = AnimationController(vsync: this,duration: Duration(seconds: 2));
      animation = Tween<double>(begin: 0,end: 300).animate(controller);
      controller.forward();
//      ..addListener((){
//        setState(() {
//          animationValue = animation.value;
//        });
//    })
//      ..addStatusListener((status) {
//        setState(() {
//          animationStatus = status;
//        });
//      });
    }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('动画示例'),
          leading: BackButton(
            onPressed: (){
              Navigator.pop(context);
            },
          ),
        ),
        body: Container(
          alignment: Alignment.center,
          child: GrowTransition(animation: animation,child: iconLogo(),),
          //2

//          AnimationLogo(animation: animation,),

//1
//          Column(  
//            children: <Widget>[
//              GestureDetector(
//                onTap: (){
//                  controller.reset();
//                  controller.forward();
//                },
//                child: Text('点击开始'),
//              ),
//              Text('动画state：'+ animationStatus.toString(),textDirection: TextDirection.ltr,),
//              Text('动画value:'+ animationValue.toString(),textDirection: TextDirection.ltr,),
//              Container(
//                height: animation.value,
//                width: animation.value,
//                child: FlutterLogo(),
//              )
//            ],
//          ),
        ),
      ),
    );
  }
  @override
  void dispose() {
    // TODO: implement dispose
    controller.dispose();
    super.dispose();
  }
}
