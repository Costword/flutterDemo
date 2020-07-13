import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart' show timeDilation;
class animationHeroPage extends StatefulWidget {
  @override
  _animationHeroPageState createState() => _animationHeroPageState();
}

class photoHero extends StatelessWidget {
  final String photoName;
  final VoidCallback ontap;
  final double width;
  const photoHero({Key key, this.photoName, this.ontap, this.width}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width:  width,
      child: Hero(tag: photoName, child: Material(
        color: Colors.transparent,
        child: Material(
          child: InkWell(
            onTap: ontap,
            child: Image.network(photoName,fit: BoxFit.contain,),
          ),
        ),
      )),
    );
  }
}

class HeroAnimation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
  timeDilation = 10.0;
    return Scaffold(
      appBar: AppBar(
        title: Text('Hero动画效果展示'),
      ),
      body: Center(
        child: photoHero(
          photoName: 'https://www.devio.org/img/avatar.png',
          width: 300,
          ontap: (){
            Navigator.of(context).push(MaterialPageRoute(builder: (context){
              return Container(
                color: Colors.lightBlueAccent,
                padding: EdgeInsets.all(16),
                alignment: Alignment.topLeft,
                child: photoHero(
                  photoName: 'https://www.devio.org/img/avatar.png',
                  width: 100,
                  ontap: (){
                    Navigator.of(context).pop();
                  },
                ),
              );
            })
            );
          },
        ),
      ),
    );
  }
}

class _animationHeroPageState extends State<animationHeroPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hero动画效果展示',
      home:Scaffold(
          appBar: AppBar(
            title: Text('Hero动画效果展示'),
            leading: BackButton(onPressed: (){
              Navigator.pop(context);
            },),
          ),
          body:HeroAnimation(),
      ),
    );
  }
}
