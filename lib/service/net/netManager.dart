import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dio/adapter.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';
import 'package:cookie_jar/cookie_jar.dart';
import 'package:dio_http_cache/dio_http_cache.dart';
import '../../config/commonConfig.dart';
import 'baseEntity.dart';
import 'baseListEntity.dart';
import 'errorEntity.dart';
import 'headerInterceptor.dart';
import 'logInterceptor.dart';
import 'netMethod.dart';
import 'package:dio_flutter_transformer/dio_flutter_transformer.dart';

class NetManager {
  static  NetManager _shared;

  factory NetManager(){
    if(_shared == null){
      _shared = NetManager._();
    }
    return _shared;
  }

  NetManager._();

  Dio dio;

  init(String baseUrl,{BaseOptions option}) {
    if(option == null){
      BaseOptions options = BaseOptions(
        baseUrl: baseUrl,
        contentType: Headers.jsonContentType,
        responseType: ResponseType.json,
        receiveDataWhenStatusError: false,
        connectTimeout: 30000,
        receiveTimeout: 3000,
      );
      dio = Dio(options);
      var cookieJar=CookieJar();
      dio.interceptors.add(CookieManager(cookieJar));
      dio.interceptors.add(HeaderInterceptores());
      dio.interceptors.add(DioCacheManager(CacheConfig(baseUrl: baseUrl)).interceptor);
      dio.interceptors.add(new LogInterceptors());
      dio.transformer = FlutterTransformer();

//      (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate  = (client) {
//        client.badCertificateCallback=(X509Certificate cert, String host, int port){
//          if(cert.pem==CommonConfig.PEM){ // Verify the certificate
//            return true;
//          }
//          return false;
//        };
//      };
    }else{
      option.baseUrl = baseUrl;
      dio = Dio(option);
      dio.interceptors.add(new LogInterceptors());
    }
  }

  // 请求，返回参数为 T
  // method：请求方法，NWMethod.POST等
  // path：请求地址
  // params：请求参数
  // success：请求成功回调
  // error：请求失败回调
  Future request<T>(NetMethod method, String path, {Map<String, dynamic> params,dynamic data,Map<String, dynamic> headers
    ,Options option,Function(T) success, Function(ErrorEntity) error,
    ProgressCallback uploadProgress,ProgressCallback  downloadProgress,CancelToken cancelToken}) async {
    try {
      Options options;
      if(option == null){
        options = Options(method: NetMethodValues[method],headers: headers);
      }else{
        options = option.merge(method: NetMethodValues[method],headers: headers);
      }

      Response response = await dio.request(path,data: data,queryParameters: params, options: options,
        cancelToken: cancelToken,
        onSendProgress: uploadProgress,onReceiveProgress: downloadProgress);
      if (response != null) {
        BaseEntity entity = BaseEntity<T>.fromJson(response.data);
        if (entity.code == BaseEntity.success) {
          success(entity.data);
        } else {
          error(ErrorEntity(code: entity.code, message: entity.message));
        }
      } else {
        error(ErrorEntity(code: -1, message: "未知错误"));
      }
    } on DioError catch(e) {
      error(createErrorEntity(e));
    }
  }

  Future download<T>(String path, String localPath,{Map<String, dynamic> headers, Map<String, dynamic> params,dynamic data
    ,Function(T) success, Function(ErrorEntity) error,
    ProgressCallback  downloadProgress,CancelToken cancelToken}) async{
    try {
      Response response = await dio.download(path, localPath,queryParameters: params,data: data,cancelToken: cancelToken,onReceiveProgress: downloadProgress);
      if (response != null) {
        success(response.data);
      } else {
        error(ErrorEntity(code: -1, message: "未知错误"));
      }
    } on DioError catch(e) {
      error(createErrorEntity(e));
    }
  }

  Future upload<T>(String path, FormData data,{Map<String, dynamic> headers
    ,Function(T) success, Function(ErrorEntity) error,
    ProgressCallback  uploadProgress,CancelToken cancelToken}) async{
    try {
      Response response = await dio.post(path,data: data,cancelToken: cancelToken,onSendProgress: uploadProgress );
      if (response != null) {
        BaseEntity entity = BaseEntity<T>.fromJson(response.data);
        if (entity.code == BaseEntity.success) {
          success(entity.data);
        } else {
          error(ErrorEntity(code: entity.code, message: entity.message));
        }
      } else {
        error(ErrorEntity(code: -1, message: "未知错误"));
      }
    } on DioError catch(e) {
      error(createErrorEntity(e));
    }
  }

  // 请求，返回参数为 List<T>
  // method：请求方法，NWMethod.POST等
  // path：请求地址
  // params：请求参数
  // success：请求成功回调
  // error：请求失败回调
  Future requestList<T>(NetMethod method, String path, {Map<String, dynamic> params,dynamic data,Map<String, dynamic> headers , Function(List<T>) success, Function(ErrorEntity) error,
    ProgressCallback uploadProgress,ProgressCallback  downloadProgress,CancelToken cancelToken}) async {
    try {
      Options options = Options(method: NetMethodValues[method],headers: headers);
      Response response = await dio.request(path, data: data,queryParameters: params, options: options,
          cancelToken: cancelToken,
          onSendProgress: uploadProgress,onReceiveProgress: downloadProgress);
      if (response != null) {
        BaseListEntity entity = BaseListEntity<T>.fromJson(response.data);
        if (entity.code == BaseEntity.success) {
          success(entity.data);
        } else {
          error(ErrorEntity(code: entity.code, message: entity.message));
        }
      } else {
        error(ErrorEntity(code: -1, message: "未知错误"));
      }
    } on DioError catch(e) {
      error(createErrorEntity(e));
    }
  }

  // 错误信息
  ErrorEntity createErrorEntity(DioError error) {
    switch (error.type) {
      case DioErrorType.CANCEL:{
        return ErrorEntity(code: -1, message: "请求取消");
      }
      break;
      case DioErrorType.CONNECT_TIMEOUT:{
        return ErrorEntity(code: -1, message: "连接超时");
      }
      break;
      case DioErrorType.SEND_TIMEOUT:{
        return ErrorEntity(code: -1, message: "请求超时");
      }
      break;
      case DioErrorType.RECEIVE_TIMEOUT:{
        return ErrorEntity(code: -1, message: "响应超时");
      }
      break;
      case DioErrorType.RESPONSE:{
        try {
          int errCode = error.response.statusCode;
          String errMsg = error.response.statusMessage;
          return ErrorEntity(code: errCode, message: errMsg);
//          switch (errCode) {
//            case 400: {
//              return ErrorEntity(code: errCode, message: "请求语法错误");
//            }
//            break;
//            case 403: {
//              return ErrorEntity(code: errCode, message: "服务器拒绝执行");
//            }
//            break;
//            case 404: {
//              return ErrorEntity(code: errCode, message: "无法连接服务器");
//            }
//            break;
//            case 405: {
//              return ErrorEntity(code: errCode, message: "请求方法被禁止");
//            }
//            break;
//            case 500: {
//              return ErrorEntity(code: errCode, message: "服务器内部错误");
//            }
//            break;
//            case 502: {
//              return ErrorEntity(code: errCode, message: "无效的请求");
//            }
//            break;
//            case 503: {
//              return ErrorEntity(code: errCode, message: "服务器挂了");
//            }
//            break;
//            case 505: {
//              return ErrorEntity(code: errCode, message: "不支持HTTP协议请求");
//            }
//            break;
//            default: {
//              return ErrorEntity(code: errCode, message: "未知错误");
//            }
//          }
        } on Exception catch(_) {
          return ErrorEntity(code: -1, message: "未知错误");
        }
      }
      break;
      default: {
        return ErrorEntity(code: -1, message: error.message);
      }
    }
  }
}