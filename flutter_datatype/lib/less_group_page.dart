import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_color_plugin/flutter_color_plugin.dart';

class less_group_pagePage extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    TextStyle texstyle = TextStyle(fontSize: 20);
    return MaterialApp(
      title: '如何使用Flutter包和插件？',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
            title: Container(
              alignment: Alignment.center,
              child: Text('statelessWidget与基础组件'),
            ),
          leading: GestureDetector(
            onTap: (){
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back),
          ),
        ),
        body: Container(
          decoration: BoxDecoration(color: Colors.white),
          alignment: Alignment.center,
          child: Column(
            children: <Widget>[
              Text('我是一个文本，很长很长',
                  style: texstyle
              ),
              Icon(
                  Icons.android,
                size: 50,
                color: Colors.green,
              ),
              CloseButton(),
              BackButton(),
              Chip(
                onDeleted: (){
                  
                },
                deleteIcon: Icon(Icons.people),
                  label: Text('带图标的文本标签'),
                avatar:Icon(Icons.pages),
              ),
              Divider(
                //分割线
                height: 10,//容器高度
                indent: 10,//左侧间距
                endIndent: 10,//右侧间距
                thickness: 5,//线高度
                color: Colors.orange,
              ),
              Card(
                //带有圆角，阴影，边框的卡片
                color: Colors.blue,
                elevation: 5,
                margin: EdgeInsets.all(10),
                child: Container(
                  padding: EdgeInsets.all(10),
                    child: Text('我是一个卡片',style: texstyle),
                )
              ),
              AlertDialog(
                title: Container(
                  alignment: Alignment.center,
                  child: Text('我是标题哦'),
                ),
                content: Text('我是内容,内容一定要比标题长'),
              )
            ],
          ),
        ),
      ),
    );
  }
}

