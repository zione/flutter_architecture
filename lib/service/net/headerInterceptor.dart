import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import '../../config/commonConfig.dart';

class HeaderInterceptores extends InterceptorsWrapper{
  @override
  onRequest(RequestOptions options) async {
    ///超时
    if(defaultTargetPlatform == TargetPlatform.android){
      options.headers[HttpHeaders.userAgentHeader] = CommonConfig.PLATFORM_ANDROID;
    }else{
      options.headers[HttpHeaders.userAgentHeader] = CommonConfig.PLATFORM_IOS;
    }
    options.headers["version"] = CommonConfig.VERSION;

    return options;
  }
}