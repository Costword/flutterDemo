import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class launchPage extends StatefulWidget {
  @override
  _launchPageState createState() => _launchPageState();
}

class _launchPageState extends State<launchPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '如何打开第三方应用或者浏览器',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('如何打开第三方应用或者浏览器'),
          leading: GestureDetector(
            onTap: (){
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back),
          ),
        ),
        body: Column(
          children: <Widget>[
            RaisedButton(onPressed:() => _openUrl('https://www.baidu.com/'),
              textColor: Colors.red,
              child: Text('打开浏览器'),
            ),
            RaisedButton(onPressed:() => _openMap(),
              textColor: Colors.red,
              child: Text('打开地图'),
            ),
          ],
        ),
      ),
    );
  }
  _openUrl(String url) async{
    if (await canLaunch(url)) {
    await launch(
    url,
    forceSafariVC: false,
    forceWebView: false,
    headers: <String, String>{'my_header_key': 'my_header_value'},
    );
    } else {
    throw 'Could not launch $url';
    }
  }
  _openMap() async{
    const url = 'geo:52.32,4.917'; //APP提供者提供的 schema
    if(await canLaunch(url))
      {
        //android
        await launch(url);
      }else
        {
          //ios
          const url = 'http://maps.apple.com/?ll=52.32,4.917';
              if(await canLaunch(url))
                {
                  await launch(url);
                }else
                  {
                    throw 'Could not launch $url';
                  }
        }
  }
}





