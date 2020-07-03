import 'package:flutter/material.dart';

///
class statefulGroup extends StatefulWidget {
  @override
  _statefulGroupState createState() => _statefulGroupState();
}

class _statefulGroupState extends State<statefulGroup> {
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    TextStyle texstyle = TextStyle(fontSize: 20);
    return MaterialApp(
      title: 'stafulWidget的用法',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
            title: Container(
              alignment: Alignment.center,
              child: Text('stafulWidget的用法与基础组件'),
            ),
          leading: GestureDetector(
            onTap: (){
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back),
          ),
        ),
        //bottomNavigationBar至少包含两个元素
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
            onTap: (index){
            setState(() {
              _currentIndex = index;
            });
            },
            items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.home),
            activeIcon: Icon(Icons.home,color: Colors.blue),
            title: Text('首页'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            activeIcon: Icon(Icons.list,color: Colors.blue),
            title: Text('列表'),
          ),
        ]),
        floatingActionButton: FloatingActionButton(
          onPressed: null,
          child: Text('点我'),
        ),
        body:_currentIndex==0? RefreshIndicator(
            child:
                ListView(
                  children: <Widget>[
                    Container(
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
                          ),
                         Container(
                           width: 100,
                           height: 100,
                           decoration: BoxDecoration(
                             borderRadius: BorderRadius.circular(10),
                             image: DecorationImage(
                               image: NetworkImage('https://www.devio.org/img/avatar.png')
                             )
                           ),
                         ),
                          TextField(
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                              hintText: '请输入内容',
                              hintStyle: TextStyle(color: Colors.grey,
                                fontSize: 18,
                              )
                            ),
                          ),
                          Container(
                            height: 200,
                            margin: EdgeInsets.only(top: 10),
                            decoration: BoxDecoration(color: Colors.lightGreen),
                            child: PageView(
                              children: <Widget>[
                                _item('page1', Colors.orange),
                                _item('page2', Colors.red),
                                _item('page3', Colors.blue),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
            onRefresh: _handelRefresh
        ):Column(
          children: <Widget>[
            Text('列表'),
            Expanded(
              child: Container(
                decoration: BoxDecoration(color: Colors.red),
                child: Text('填充整个屏幕剩余高度'),
              ),
            ),
          ],
        ),
      ),
    );
  }
  Future<Null> _handelRefresh() async{
    await Future.delayed(Duration(milliseconds: 200));
    return null;
  }
  _item(String title,Color colorl)
  {
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(color: colorl),
      child: Text(title),
    );
  }

}
