import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'app.dart';
import 'config/envConfig.dart';


Future<Null> main() async{
  Future<Null> _reportError(dynamic error, dynamic stackTrace) async {
    return Future.delayed(const Duration(seconds: 2), (){
      debugPrint("_reportError");
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

  var configuredApp = EnvConfig(
    debug: false,
    appName: 'dev',
    apiBaseUrl: 'http://api.dev.com/',
    child: App(),
  );
  runZoned<Future<Null>>(() async {
    runApp(configuredApp);
  }, onError: (error, stackTrace) async{
    await _reportError(error, stackTrace);
  });

}