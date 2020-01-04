import 'package:json_annotation/json_annotation.dart';

part 'student.g.dart';

@JsonSerializable(explicitToJson: true)
class Student extends Object{
  int id;
  String name;
  int age;

  Student(this.id, this.name, this.age);

  factory Student.fromJson(Map<String, dynamic> json) =>
      _$StudentFromJson(json);

  Map<String, dynamic> toJson() => _$StudentToJson(this);
}