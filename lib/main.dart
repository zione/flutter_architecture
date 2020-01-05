import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'app.dart';
import 'config/envConfig.dart';
import 'config/prodConfig.dart';
import 'route/routes.dart';
import 'service/net/netManager.dart';
import 'package:fluro/fluro.dart';

Future<Null> main() async{
  Future<Null> _reportError(dynamic error, dynamic stackTrace) async {
    return Future.delayed(const Duration(seconds: 2), (){
      debugPrint("_reportError:"+error);
      return Future.value();
    });
  }

  FlutterError.onError = (FlutterErrorDetails details) async{
    Zone.current.handleUncaughtError(details.exception, details.stack);
  };

  ErrorWidget.builder = (FlutterErrorDetails flutterErrorDetails){
    return Scaffold(
        body: Center(
          child: Text("Custom Error Widget"),
        )
    );
  };

  debugPrint = (String message, {int wrapWidth}) {};  //关闭打印
  _initRoute();
  _initNet();
  var configuredApp = EnvConfig(
    debug: Config.debug,
    appName: Config.appName,
    child: App(),
  );
  runZoned<Future<Null>>(() async {
    runApp(configuredApp);
  }, onError: (error, stackTrace) async{
    await _reportError(error, stackTrace);
  });
}

//初始化网络
void _initNet(){
  NetManager().init(Config.apiBaseUrl);
}

void _initRoute(){
  final router = Router();
  Routes.configureRoutes(router);
  Routes.router = router;
}


