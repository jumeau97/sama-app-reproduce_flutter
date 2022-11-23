// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'terms.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Terms _$TermsFromJson(Map<String, dynamic> json,) => Terms(
      json['id'] as int,
      json['term'] as String,
      json['amount'] as int,
      Channel.fromJson(json['subscribe']),
    );

Map<String, dynamic> _$TermsToJson(Terms instance) => <String, dynamic>{
      'id': instance.id,
      'term': instance.term,
      'amount': instance.amount,
      'subscribe': instance.subscribe,
    };
