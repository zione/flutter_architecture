import 'package:flutter_architecture/model/entity/user.dart';
import 'package:json_annotation/json_annotation.dart';

part 'shop.g.dart';

@JsonSerializable(explicitToJson: true)
class Shop extends Object{
  int id;
  String name;
  List<User> employees;

  Shop(this.id, this.name, this.employees);

  factory Shop.fromJson(Map<String, dynamic> json) =>
      _$ShopFromJson(json);

  Map<String, dynamic> toJson() => _$ShopToJson(this);
}