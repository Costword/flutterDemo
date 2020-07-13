import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:cached_network_image/cached_network_image.dart';

class imagesPage extends StatefulWidget {
  @override
  _imagesPageState createState() => _imagesPageState();
}

class _imagesPageState extends State<imagesPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('flutter如何加载图片'),
          leading: BackButton(
            onPressed: (){
              Navigator.pop(context);
            },
          ),
        ),
        body: Center(
          child: Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(color:  Colors.white),
            child: Column(
              children: <Widget>[
                Card(
                  margin: EdgeInsets.all(20),
                  child: Column(
                    children: <Widget>[
                      Text('资源图片'),
                      Image(image: AssetImage('images/timg.jpg'),width: 100,height: 100,),
                    ],
                  ),
                ),
                Card(
                  margin: EdgeInsets.all(20),
                  child: Column(
                    children: <Widget>[
                      Text('网络图片'),
                      FadeInImage.memoryNetwork(placeholder:
                          kTransparentImage, image: 'https://www.devio.org/img/avatar.png')
                    ],
                  ),
                ),
                Card(
                  margin: EdgeInsets.all(20),
                  child: Column(
                    children: <Widget>[
                      Text('缓存网络图片'),
                      CachedNetworkImage(
                        width: 200,
                        height: 200,
                        fit: BoxFit.fill,
                        imageUrl: 'https://www.devio.org/img/avatar.png',
                        placeholder: (context,url)=>CircularProgressIndicator(),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}


class images_pagePage extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '如何加载图片',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: '如何使用Flutter包和插件？'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '',
              style: Theme
                  .of(context)
                  .textTheme
                  .display1,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
