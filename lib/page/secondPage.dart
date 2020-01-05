import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';

import 'package:flutter/material.dart';

import '../route/routes.dart';

class SecondPage extends StatefulWidget{

  @override
  State<StatefulWidget> createState() {
    return _SecondPageState();
  }
}



class _SecondPageState extends State<SecondPage>{
  var _image;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("imagepicker"),
      ),
      body: Column(
        children: <Widget>[
          Container(
            width: 300,
            height: 300,
            child: _ImageView(_image),
          ),
          RaisedButton(
            child: Text("相机"),
            onPressed: _tackPhoto,
          ),
          RaisedButton(
            child: Text("相册"),
            onPressed: _tosetting,
          )
        ],
      ),
    );
  }


  Widget _ImageView(image){
    if(image == null){
      return Center(
        child: Text("请选择图片"),
      );
    }else{
      return Image.file(
        image
      );
    }
  }

  _tosetting(){
    Routes.navigateTo(context, Routes.setting);
  }

  _tackPhoto() async{
    var image = await ImagePicker.pickImage(source: ImageSource.camera);
    setState((){
      _image = image;
    });
  }

  _tackGallery() async{
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);
    setState((){
      _image = image;
    });
  }
}