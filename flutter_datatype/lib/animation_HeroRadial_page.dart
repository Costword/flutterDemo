import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart' show timeDilation;
import 'dart:math' as math;

class animationHeroRadialPage extends StatefulWidget {
  @override
  _animationHeroRadialPageState createState() => _animationHeroRadialPageState();
}

class smallPhoto extends StatelessWidget {
  final String photoName;
  final double width;
  final VoidCallback ontap;
  const smallPhoto({Key key, this.photoName, this.width, this.ontap}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: InkWell(
        child: Image.network(photoName,fit: BoxFit.contain,),
        onTap: ontap,
      ),
    );
  }
}

class RadialExpansion extends StatelessWidget {
  final double maxRadious;
  final clipRectSize;
  final Widget child;

  const RadialExpansion({Key key,
    this.maxRadious,
    this.child}):clipRectSize = 2.0 * (maxRadious/math.sqrt2) , super(key: key);
  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: Center(
        child: SizedBox(
          width: clipRectSize,
          height: clipRectSize,
          child: ClipRect(
            child: child,
          ),
        ),
      ),
    );
  }
}

class RadialExpansDemo extends StatelessWidget {
  static const double kMinRadius = 32.0;
  static const double kMaxRadius = 132.0;
  static const opacityVure = const Interval(0.0, 0.75,curve:  Curves.fastOutSlowIn);
  static RectTween _creatRectTween(Rect begin,Rect end){
    return  MaterialRectCenterArcTween(begin:  begin, end: end);
  }
  static Widget _buildPage(BuildContext context,String photoname,String desc){
    return Container(
      color: Theme.of(context).canvasColor,
      child: Center(
        child: Card(
          elevation: 8,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              SizedBox(
                width:  kMaxRadius * 2,
                height: kMaxRadius * 2,
                child: Hero(
                    createRectTween: _creatRectTween,
                    tag: photoname,
                    child: RadialExpansion(
                  maxRadious: kMaxRadius,
                  child: smallPhoto(
                    photoName: photoname,
                    ontap: (){
                      Navigator.of(context).pop();
                    },
                  ),
                )),
              ),
              Text(
                desc,
                style: TextStyle(fontWeight: FontWeight.bold),
                textScaleFactor: 3.0,
              ),
              const SizedBox(
                height: 15,
              ),
            ],
          ),
        ),
      ),
    );
  }
  Widget _buildHero(BuildContext context,String photoname,String desc){
    return Container(
      width: kMinRadius*2,
      height: kMinRadius*2,
      child: Hero(
          createRectTween: _creatRectTween,
          tag: photoname,
          child: smallPhoto(
        photoName: photoname,
        ontap: (){
          Navigator.of(context).push(
            PageRouteBuilder<void>(
              pageBuilder:(BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation){
                return AnimatedBuilder(
                    animation: animation,
                    builder: (context,child){
                      return Opacity(opacity: opacityVure.transform(animation.value),
                      child: _buildPage(context, photoname, desc),);
                    });
              }
            )
          );
        },
      )),
    );
  }
  @override
  Widget build(BuildContext context) {
    timeDilation = 5.0;
    return Container(
      padding: EdgeInsets.all(32),
      alignment: FractionalOffset.bottomCenter,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          _buildHero(context, 'https://www.devio.org/img/avatar.png', 'laohu'),
          _buildHero(context, 'https://image.baidu.com/search/down?tn=download&ipn=dwnl&word=download&ie=utf8&fr=result&url=http%3A%2F%2Fdik.img.kttpdq.com%2Fpic%2F154%2F107722%2Fefcf163854c0fb61_1440x900.jpg&thumburl=https%3A%2F%2Fss3.bdstatic.com%2F70cFv8Sh_Q1YnxGkpoWK1HF6hhy%2Fit%2Fu%3D1348943712%2C3203171815%26fm%3D26%26gp%3D0.jpg', 'nicai'),
          _buildHero(context, 'https://image.baidu.com/search/down?tn=download&ipn=dwnl&word=download&ie=utf8&fr=result&url=http%3A%2F%2Fdik.img.kttpdq.com%2Fpic%2F40%2F27946%2F4973344da8550a08_1680x1050.jpg&thumburl=https%3A%2F%2Fss3.bdstatic.com%2F70cFv8Sh_Q1YnxGkpoWK1HF6hhy%2Fit%2Fu%3D1449216156%2C3237951109%26fm%3D26%26gp%3D0.jpg', 'xiaohuang'),
        ],
      ),
    );
  }
}

class _animationHeroRadialPageState extends State<animationHeroRadialPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hero镜像动画效果展示'),
      ),
      body: RadialExpansDemo(),
    );
  }
}
