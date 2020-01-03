import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_architecture/config/envConfig.dart';
import 'package:flutter_architecture/generated/i18n.dart';
import 'package:flutter_architecture/model/dao/pdf_dao.dart';
import 'package:flutter_architecture/model/entity/shop.dart';
import 'package:flutter_architecture/model/entity/user.dart';
import 'package:flutter_architecture/utils/screen_util.dart';

import 'dart:convert';

import '../model/dao/user_dao.dart';

class MainPage extends StatelessWidget{

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
        child: Center(
          child: Container(
            color: Colors.yellow,
            width: SU.w(100),
            height: SU.w(100),
            child: Center(
              child: Text(S.of(context).submit),
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.error),
        onPressed: (){
//          UserDao.login("13661660459", "654321");
          PdfDao.downloadPdf();
        },
      ),
    );
  }
}