import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_architecture/config/envConfig.dart';
import 'package:flutter_architecture/generated/i18n.dart';
import 'package:flutter_architecture/model/shop.dart';
import 'package:flutter_architecture/model/user.dart';
import 'package:flutter_architecture/model/fruit.dart';
import 'package:flutter_architecture/service/screen_util.dart';

import 'dart:convert';

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
//          throw StateError('This is a Dart exception.');
          var user1 = new User(4, "hy", "明德中学", 20);
          var user2 = new User(6, "zion", "启德中学", 22);
          List<User> employees = [user1,user2];
          var shop = new Shop(1,"城北水果店",employees);

          String str = json.encode(shop);
          debugPrint("json:"+str);
        },
      ),
    );
  }
}