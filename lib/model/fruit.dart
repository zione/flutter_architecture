import 'package:json_annotation/json_annotation.dart';

part 'fruit.g.dart';

@JsonLiteral('fruit.json', asConst: true)
Map<String, dynamic> get fruit => _$fruitJsonLiteral;