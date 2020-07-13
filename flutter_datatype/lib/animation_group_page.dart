import 'package:flutter/material.dart';

class animationGroupPage extends StatefulWidget {
  @override
  _animationGroupPageState createState() => _animationGroupPageState();
}

class flutterLogo extends StatelessWidget {

  Widget build(BuildContext context)=>Container(
    padding: EdgeInsets.symmetric(vertical: 10),
    child: FlutterLogo(),
  );
}

class FlutterAnimation extends StatelessWidget {
  FlutterAnimation({this.child , this.animation});
  Widget child;
  Animation<double> animation;
  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation:  animation,
      builder: (context,child)=>Container(
        width: animation.value,
        height: animation.value,
        child: child,
      ),
      child: child,
    );
  }
}

class _animationGroupPageState extends State<animationGroupPage> with SingleTickerProviderStateMixin {
  Animation<double> animation;
  AnimationController controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = AnimationController(vsync: this,duration:Duration(seconds: 2));
    animation = Tween<double>(begin: 0,end: 300).animate(controller);
    controller.forward();
  }
  @override
  void dispose() {
    // TODO: implement dispose
    controller.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
      primarySwatch: Colors.blue,
    ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('动画效果演示'),
          leading: BackButton(
          onPressed: (){
            Navigator.pop(context);
          },
        ),
        ),
          body: Center(
            child: FlutterAnimation(animation: animation,child: flutterLogo(),),
        ),
    ),
);
  }
}


