import 'package:flutter/material.dart';

class resourcePage extends StatefulWidget {
  @override
  _resourcePageState createState() => _resourcePageState();
}

class _resourcePageState extends State<resourcePage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'flutter如何加载资源文件',
      theme:ThemeData(
          primarySwatch: Colors.blue
      ) ,
      home: Scaffold(
        appBar: AppBar(
          title: Text('flutter如何加载资源文件'),
          leading: GestureDetector(
            onTap: (){
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back),
          ),
        ),
        body:
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Image(
                    width: 100,
                    height: 100,
                    image: AssetImage('images/timg.jpg'),
                  ),
                ],
              ),
            )
      ),
    );
  }
}
