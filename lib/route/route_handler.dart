import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'dart:convert' as convert;

import '../page/mainPage.dart';
import '../page/secondPage.dart';
import '../page/setting/settingPage.dart';

var rootHandler =
Handler(handlerFunc: (BuildContext context, Map<String, dynamic> params) {
  return MainPage();
});

var secondHandler =
Handler(handlerFunc: (BuildContext context, Map<String, dynamic> params) {
  return SecondPage();
});

// 设置页 - 示例：不传参数
var settingHandler =
Handler(handlerFunc: (BuildContext context, Map<String, dynamic> params) {
  return SettingPage();
});

// 网页加载 - 示例：传多个字符串参数
//var webViewHandler =
//Handler(handlerFunc: (BuildContext context, Map<String, dynamic> params) {
//  // params内容为  {title: [我是标题哈哈哈], url: [https://www.baidu.com/]}
//  String title = params['title']?.first;
//  String url = params['url']?.first;
//  return WebViewUrlPage(
//    title: title,
//    url: url,
//  );
//});

// 示例：传多个model参数
//var wxSharePayHandler =
//Handler(handlerFunc: (BuildContext context, Map<String, dynamic> params) {
//  UserInfoModel _model1 =
//  UserInfoModel.fromJson(convert.jsonDecode(params['userInfoModel'][0]));
//  UserInfoModel _model2 =
//  UserInfoModel.fromJson(convert.jsonDecode(params['userInfoModel2'][0]));
//
//  return WxSharePage(
//    userInfoModel: _model1,
//    userInfoModel2: _model2,
//  );
//});