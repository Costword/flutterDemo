#import 'package:flutter/material.dart';

/// flutter widget���������� statefulWidget
/// statefulWidget ���������ڿ��Է�Ϊ����
/// 1��ʼ��������
/// creatState initState
/// 2������������
/// didChangeDependencises ,build,didUpdateWidget
/// 3 ������������
/// deactivate,dispose
///
class flutterLifeCycle extends StatefulWidget {
  @override
  _flutterLifeCycleState createState() => _flutterLifeCycleState();
}

class _flutterLifeCycleState extends State<flutterLifeCycle> {
  ///���Ǵ���statefulWidget����õĵ�һ������
  ///�൱��ios��viewDidLoad
  ///�������ͨ������һЩ��ʼ������������channel�ĳ�ʼ�����������ĳ�ʼ��
  @override
  void initState() {
    // TODO: implement initState

    print('---------initState----------');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
