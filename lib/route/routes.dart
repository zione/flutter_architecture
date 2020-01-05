import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';
import 'route_handler.dart';

class Routes {
  static Router router;

  static String root = '/';
  static String seconde = '/second';
  static String setting = '/setting';

  // 配置route
  static void configureRoutes(Router router) {
    // 未发现对应route
    router.notFoundHandler = Handler(handlerFunc: (BuildContext context, Map<String, dynamic> params) {
      print('route not found!');
      return;
    });

    router.define(root, handler: rootHandler); // 根目录
    router.define(seconde, handler: secondHandler); // 根目录
    router.define(setting, handler: settingHandler); // 设置
  }

  // 对参数进行encode，解决参数中有特殊字符，影响fluro路由匹配
  static Future navigateTo(BuildContext context, String path, {Map<String, dynamic> params,bool replace = false,
    bool clearStack = false, TransitionType transition = TransitionType.native}) {
    String query =  "";
    if (params != null) {
      int index = 0;
      for (var key in params.keys) {
        var value = Uri.encodeComponent(params[key]);
        if (index == 0) {
          query = "?";
        } else {
          query = query + "\&";
        }
        query += "$key=$value";
        index++;
      }
    }
    debugPrint('我是navigateTo传递的参数：$query');

    path = path + query;
    return router.navigateTo(context, path, transition:transition, replace: replace,clearStack: clearStack);
  }
}