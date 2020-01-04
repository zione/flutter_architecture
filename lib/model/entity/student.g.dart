// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'student.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Student _$StudentFromJson(Map<String, dynamic> json) {
  return Student(
    json['id'] as int,
    json['name'] as String,
    json['age'] as int,
  );
}

Map<String, dynamic> _$StudentToJson(Student instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'age': instance.age,
    };
