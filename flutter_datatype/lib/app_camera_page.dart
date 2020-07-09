import 'dart:async';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';


class appPickerPage extends StatefulWidget {
  @override
  _appPickerPageState createState() => _appPickerPageState();
}

class _appPickerPageState extends State<appPickerPage> {
  List _imagesArray = [];
  bool isVideo = false;
  String _retrieveDataError;

  final ImagePicker _picker = ImagePicker();
  final TextEditingController maxWidthController = TextEditingController();
  final TextEditingController maxHeightController = TextEditingController();
  final TextEditingController qualityController = TextEditingController();

  void onImageButtonPressed(bool islibrary) async {

    Navigator.pop(context);
    final pickedFile = await _picker.getImage(
      source: islibrary?ImageSource.gallery:ImageSource.camera,
    );
    setState(() {
      _imagesArray.add(File(pickedFile.path));
    });
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Image Picker Demo',
      home: Scaffold(
        appBar: AppBar(
          title: Text('拍照app'),
          leading: BackButton(
            onPressed: (){
              Navigator.pop(context);
            },
          ),
        ),
        body: Center(
          child:  Wrap(
          spacing: 5,
          runSpacing:5,
          children: _cardImage(),
        ),
        ),
        floatingActionButton: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            FloatingActionButton(
              onPressed: () {
                isVideo = false;
//              _onImageButtonPressed(ImageSource.gallery, context: context);
                _imageButtonPress();
              },
              heroTag: 'image0',
              tooltip: '从相册获取图片',
              child: const Icon(Icons.photo_library),
            ),
          ],
        ),
      ),
    );
  }
  @override
  void deactivate() {
    super.deactivate();
  }

  @override
  void dispose() {
    super.dispose();
  }

  _cardImage(){

    return List<Widget>.from(_imagesArray.map((image) => Stack(
      children: <Widget>[
        ClipRRect(
          borderRadius: BorderRadius.circular(5),
          child: Image.file(image,width: 110,height: 90,fit: BoxFit.fill),
        ),
        Positioned(
            right: 5,
            top: 5,
            child: GestureDetector(
              onTap: (){
                setState(() {
                  _imagesArray.remove(image);
                });
              },
              child: ClipOval(
                child: Container(
                  padding: EdgeInsets.all(3),
                  decoration: BoxDecoration(color: Colors.white),
                  child: Icon(Icons.close,
                      size: 18,
                      color: Colors.black)),
                ),
              ),
            ),
      ],
    )).toList());
  }

//  Widget _previewImage() {
//    final Text retrieveError = _getRetrieveErrorWidget();
//    if (retrieveError != null) {
//      return retrieveError;
//    }
//    if (_imageFile != null) {
//      if (kIsWeb) {
//        // Why network?
//        // See https://pub.flutter-io.cn/packages/image_picker#getting-ready-for-the-web-platform
//        return Image.network(_imageFile.path);
//      } else {
//        return Image.file(File(_imageFile.path));
//      }
//    } else if (_pickImageError != null) {
//      return Text(
//        'Pick image error: $_pickImageError',
//        textAlign: TextAlign.center,
//      );
//    } else {
//      return const Text(
//        '请选择你想要的照片.',
//        textAlign: TextAlign.center,
//      );
//    }
//  }
  void _imageButtonPress() {
    showModalBottomSheet(context: context, builder: (context) => Container(
      height: 150,
      child: Column(
        children: <Widget>[
          _item('从相册中选择', true),
          _item('拍照', false),
        ],
      ),
    ),);
  }

  Text _getRetrieveErrorWidget() {
    if (_retrieveDataError != null) {
      final Text result = Text(_retrieveDataError);
      _retrieveDataError = null;
      return result;
    }
    return null;
  }
  _item(String s, bool islibrary) {
    return ListTile(
      leading: (islibrary?Icon(Icons.photo_library):Icon(Icons.camera_alt)),
      title: Text(s),
      onTap: (){
        onImageButtonPressed(islibrary);
      } ,
    );
  }
}

typedef void OnPickImageCallback(
    double maxWidth, double maxHeight, int quality);