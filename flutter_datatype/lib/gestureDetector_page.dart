import 'package:flutter/material.dart';

class gestureDetectorPage extends StatefulWidget {
  @override
  _gestureDetectorPageState createState() => _gestureDetectorPageState();
}

class _gestureDetectorPageState extends State<gestureDetectorPage> {
  String printfTapMessage = '';
  double moveX = 0,moveY = 0;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'flutter中手势的使用方法',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('flutter中手势的使用方法'),
          leading: GestureDetector(
            onTap: (){
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back),
          ),
        ),
        body: FractionallySizedBox(
              widthFactor: 1,
              child: Stack(
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      GestureDetector(
                        onTap: () => _printMsg('单击'),
                        onTapCancel: () =>_printMsg('取消'),
                        onTapDown: (e) => _printMsg('按下'),
                        onTapUp: (e) => _printMsg('松开'),
                        onDoubleTap: () => _printMsg('双击'),
                        onLongPress: () => _printMsg('长按'),
                        child: Container(
                          decoration: BoxDecoration(color: Colors.red),
                          padding: EdgeInsets.all(60),
                          child: Text('点我',style: TextStyle(fontSize: 36)),
                        ),
                      ),
                      Text(printfTapMessage),
                    ],
                  ),
                  Positioned(
                    left:moveX ,
                    top: moveY,
                    child:
                        GestureDetector(
                          onPanUpdate: (e) => _touchMove(e),
                          child:Container(
                            width: 72,
                            height: 72,
                            decoration: BoxDecoration(color:  Colors.blue ,borderRadius: BorderRadius.circular(36)),
                          ) ,
                        ),
                  )
                ],
              ),
            ),
      ),
    );
  }
  _printMsg(String msg) {
    setState(() {
      printfTapMessage +=' ,$msg';
    });
  }
  _touchMove(DragUpdateDetails event) {
    setState(() {
      moveX += event.delta.dx;
      moveY += event.delta.dy;
      print(event);
    });
  }
}







