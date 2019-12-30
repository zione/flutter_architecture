import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable()
class User extends Object{
  int id;
  String name;

  @JsonKey(name: 'school_name')
  String schoolName;
  int age;


  User(this.id, this.name, this.schoolName, this.age);

  factory User.fromJson(Map<String, dynamic> json) =>
      _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}