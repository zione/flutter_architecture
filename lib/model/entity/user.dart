import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable()
class User extends Object{
  int id;
  String userName;
  String userPhone;
  String userHead;
  int sex;
  String birthday;
  String token;
  int roleId = 1;
  int area;
  String areaName;
  String grade;
  String gradeName;
  String mySign;


  User(this.id, this.userName, this.userPhone, this.userHead, this.sex,
      this.birthday, this.token, this.roleId, this.area, this.areaName,
      this.grade, this.gradeName, this.mySign);

  factory User.fromJson(Map<String, dynamic> json) =>
      _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}