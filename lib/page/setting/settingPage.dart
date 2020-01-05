import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../route/routes.dart';


class SettingPage extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("setting"),
      ),
      body: Container(
        color: Colors.red,
        child: RaisedButton(
          child: Icon(Icons.arrow_back),
          onPressed: (){
            Routes.navigateTo(context, Routes.root,clearStack: true);
          },
        ),
      ),
    );
  }
}