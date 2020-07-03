import 'package:flutter/material.dart';
import 'package:flutterdatatype/resouse_page.dart';
import 'package:flutterdatatype/stateful_group_page.dart';

import 'gestureDetector_page.dart';
import 'launch_page.dart';
import 'layout_group_page.dart';
import 'less_group_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'flutter路由及跳转方法的使用',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('flutter路由及跳转方法的使用'),
        ),
        body: RouteNavigator(),
      ),
      routes: <String,WidgetBuilder>{
        'less':(BuildContext context)=>less_group_pagePage(),
        'ful':(BuildContext context)=>statefulGroup(),
        'layout':(BuildContext context)=>layoutGroup(),
        'gesture':(BuildContext context)=>gestureDetectorPage(),
        'res':(BuildContext context)=>resourcePage(),
        'launch':(BuildContext context)=>launchPage(),

      },
    );
  }
}

class RouteNavigator extends StatefulWidget {
  @override
  _RouteNavigatorState createState() => _RouteNavigatorState();
}

class _RouteNavigatorState extends State<RouteNavigator> {
  bool byName = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Container(
        decoration: BoxDecoration(color: Colors.white),
        alignment: Alignment.center,
        child: Column(
          children: <Widget>[
            SwitchListTile(
                title: Text('${byName?'':'不'}通过路由名跳转'),
                value: byName, onChanged: (value) {
              setState(() {
                byName = value;
              });
            }),
            _titleItem('statelessWidget与基础组件',less_group_pagePage(),'less'),
            _titleItem('statefulWidget与基础组件',statefulGroup(),'ful'),
            _titleItem('statelessWidget与基础组件',layoutGroup(),'layout'),
            _titleItem('gestureDetector(手势)与基础组件',gestureDetectorPage(),'gesture'),
            _titleItem('如何加载资源文件',resourcePage(),'res'),
            _titleItem('如何打开第三方应用',launchPage(),'launch'),
          ],
        ),
      ),
    );
  }
  _titleItem(String title,  page, String routeName) {
    return Container(
      decoration: BoxDecoration(color: Colors.white),
      alignment: Alignment.center,
      child:
      RaisedButton(onPressed: (){
        if(byName)
        {
          Navigator.pushNamed(context, routeName);
        }else
        {
          Navigator.push(context, MaterialPageRoute(builder: (context)=>page));
        }
      },
        child: Text(title),
      ),
    );
  }
}

