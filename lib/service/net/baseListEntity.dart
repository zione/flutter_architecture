import 'entityFactory.dart';

class BaseListEntity<T> {
  int code;
  String message;
  List<T> data;

  BaseListEntity({this.code, this.message, this.data});

  factory BaseListEntity.fromJson(json) {
    List<T> mData = new List<T>();
    if (json['data'] != null) {
      (json['data'] as List).forEach((v) {
        mData.add(EntityFactory.generateOBJ<T>(v));
      });
    }
    return BaseListEntity(
      code: json["code"],
      message: json["msg"],
      data: mData,
    );
  }
}