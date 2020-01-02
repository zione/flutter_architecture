// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) {
  return User(
    json['id'] as int,
    json['userName'] as String,
    json['userPhone'] as String,
    json['userHead'] as String,
    json['sex'] as int,
    json['birthday'] as String,
    json['token'] as String,
    json['roleId'] as int,
    json['area'] as int,
    json['areaName'] as String,
    json['grade'] as String,
    json['gradeName'] as String,
    json['mySign'] as String,
  );
}

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'id': instance.id,
      'userName': instance.userName,
      'userPhone': instance.userPhone,
      'userHead': instance.userHead,
      'sex': instance.sex,
      'birthday': instance.birthday,
      'token': instance.token,
      'roleId': instance.roleId,
      'area': instance.area,
      'areaName': instance.areaName,
      'grade': instance.grade,
      'gradeName': instance.gradeName,
      'mySign': instance.mySign,
    };
