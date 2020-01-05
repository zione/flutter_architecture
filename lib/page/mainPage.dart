import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_architecture/config/envConfig.dart';
import 'package:flutter_architecture/generated/i18n.dart';
import 'package:flutter_architecture/model/dao/pdf_dao.dart';
import 'package:flutter_architecture/model/dao/student_dao.dart';
import 'package:flutter_architecture/model/entity/shop.dart';
import 'package:flutter_architecture/model/entity/student.dart';
import 'package:flutter_architecture/model/entity/user.dart';
import 'package:flutter_architecture/utils/screen_util.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'dart:convert';

import 'package:flutter/material.dart';
import '../model/dao/user_dao.dart';
import '../route/routes.dart';
import 'secondPage.dart';

class MainPage extends StatelessWidget{

  void showToast(){
    Fluttertoast.showToast(
        msg: "This is Center Short Toast",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIos: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0
    );
  }


  @override
  Widget build(BuildContext context) {
    SU.init(context);
    var config = EnvConfig.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(config.appName),
      ),
      body: Container(
        color: Colors.red,
        child: new Column(
          children: <Widget>[
            FlatButton(
              child: Icon(Icons.settings),
              onPressed: (){
//                PdfDao.setDownload(true);
                  Student s = new Student(1, "h", 12);
                  StudentDao().insert(s);
              },
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.search),
        onPressed: (){
//          UserDao.login("13661660459", "654321");
//          PdfDao.hasDownload().then((bool hasload){
//            debugPrint("hasload: ${hasload??false}");
//          });
//          StudentDao().getStudentList()
//              .then((List<Student> list){
//            debugPrint("Student: ${json.encode(list)}");
//          });
            Routes.navigateTo(context, Routes.seconde);
        },
      ),
    );
  }
}