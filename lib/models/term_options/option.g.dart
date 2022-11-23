// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'option.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Option _$OptionFromJson(
  Map<String, dynamic> json,
) =>
    Option(
      json['id'] as int,
      json['name'] as String,
      json['price'] as int,
      Channel.fromJson(json['subscribe']),
    );

Map<String, dynamic> _$OptionToJson(Option instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'price': instance.price,
      'subscribe': instance.subscribe,
    };
