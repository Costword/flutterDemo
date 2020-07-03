import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class layoutGroup extends StatefulWidget {
  @override
  _layoutGroup createState() => _layoutGroup();
}

class _layoutGroup extends State<layoutGroup> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'flutter中layout的使用方法',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title:Text('flutter中layout的使用方法') ,
          leading: GestureDetector(
            onTap: (){
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back),
          ),
        ),
        body: Container(
          decoration: BoxDecoration(
            color: Colors.white,
          ),
          alignment: Alignment.center,
          child: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  ClipOval(
                    //裁剪圆形的约束
                    child: SizedBox(
                      width: 100,
                      height: 100,
                      child: Image.network('https://www.devio.org/img/avatar.png'),
                    ),
                  ),
                  Padding(
                      padding: EdgeInsets.all(10),
                    child: ClipRRect(
                      //裁剪方形圆角的约束
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      child: Opacity(
                        //设置透明度
                          opacity: 0.5,
                        child: Image.network('https://www.devio.org/img/avatar.png',
                          width:100 ,
                          height: 100,
                        ),
                      ),
                    ),
                  )
                ],
              ),
              Text('我是一个文本'),
              Container(
                height: 200,
                margin: EdgeInsets.all(10),
                decoration: BoxDecoration(color: Colors.white),
                child:
                PhysicalModel(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  clipBehavior: Clip.antiAlias,
                  child:
                  PageView(
                    children: <Widget>[
                      _pageViewItem('标题1',Colors.red),
                      _pageViewItem('标题2',Colors.green),
                      _pageViewItem('标题3',Colors.blue),
                    ],
                  ),
                ),
              ),
              Column(
                children: <Widget>[
                  FractionallySizedBox(
                    widthFactor: 0.8,
                    child: Container(
                      alignment: Alignment.center,
                      padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                      decoration: BoxDecoration(color: Colors.blue),
                      child: Text('撑满屏幕,文字很长很长很长文字很长很长很长文字很长很长很长文字很长很长很长文字很长很长很长文字很长很长很长'),
                    ),
                  ),
                ],
              ),
              Stack(
                //堆叠效果
                children: <Widget>[
                  Image.network('https://www.devio.org/img/avatar.png',
                    width:100 ,
                    height: 100,
                  ),
                  Positioned(
                    left: 0,
                    bottom: 0,
                    child: Image.network('https://www.devio.org/img/avatar.png',
                      width:36 ,
                      height: 36,
                    ),
                  )
                ],
              ),
              Wrap(
                //自动换行组件相当于collectionView
                spacing: 10,
                runSpacing: 10,
                children: <Widget>[
                  _myChip('大口径的啦'),
                  _myChip('口径的啦'),
                  _myChip('径的啦'),
                  _myChip('的啦'),
                  _myChip('你打你你打算'),
                  _myChip('批评美国吗'),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

_myChip(String str) {

  return Chip(
      label: Text(str),
    avatar: CircleAvatar(
      child: Container(
        decoration: BoxDecoration(color: Colors.blue),
        child: Text(str.substring(0,1),
        style: TextStyle(fontSize: 10)
        ),
      ),
    ),
  );
}

_pageViewItem(String title, Color bgcolor) {

  return Container(
    alignment: Alignment.center,
    decoration: BoxDecoration(color: bgcolor),
    child: Text(title),
  );
}

