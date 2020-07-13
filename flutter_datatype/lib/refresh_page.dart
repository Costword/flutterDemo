// Copyright 2019 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'dart:math' show Random;
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

//import 'package:gallery/l10n/gallery_localizations.dart';

class pullToRefreshPage extends StatefulWidget {
  @override
  _pullToRefreshPageState createState() => _pullToRefreshPageState();
}

class _pullToRefreshPageState extends State<pullToRefreshPage> {
  static const listCount = 20;
  var randomList = List<int>.generate(listCount, (i) => i + 1);

  void _shuffleList() => randomList.shuffle(Random());
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          primarySwatch: Colors.blue
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('下拉刷新列表'),
          leading: BackButton(
            onPressed: (){
            Navigator.pop(context);
          },
          ),
        ),
        body: Container(
          alignment: Alignment.center,
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(color:  Colors.white),
          child: CustomScrollView(
            physics: const BouncingScrollPhysics(
              parent: AlwaysScrollableScrollPhysics(),
            ),
            slivers: <Widget>[
              CupertinoSliverNavigationBar(
                automaticallyImplyLeading: false,
                largeTitle: Text('下拉刷新'),
              ),
              CupertinoSliverRefreshControl(
                onRefresh: (){
                  return Future<void>.delayed(const Duration(seconds: 1))
                    ..then<void>((_) {
                      if (mounted) {
                        setState(() => _shuffleList());
                      }
                    });
                },
              ),
              SliverList(
                delegate: SliverChildBuilderDelegate(
                      (context, index) {
                    final title = '下拉刷新页面$index';
                    return ListTile(title: Text(title));
                  },
                  childCount: listCount,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
