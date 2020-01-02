import '../../config/api.dart';
import '../../service/net/netManager.dart';
import '../../service/net/netMethod.dart';
import '../entity/user.dart';
import 'package:flutter/foundation.dart';
import 'package:dio_http_cache/dio_http_cache.dart';

class UserDao{
  static login(userName,password) async {
    NetManager().request(
        NetMethod.POST,
        Api.login, data: {"phone": userName, "passWord": password},
//        option: buildCacheOptions(Duration(minutes: 7)),
        success: (data) {
          User user = User.fromJson(data);
          debugPrint("success data gradename = ${user.gradeName}");
        },
        error: (error) {
          debugPrint("error code = ${error.code}, massage = ${error.message}");
        }
    );
  }
}