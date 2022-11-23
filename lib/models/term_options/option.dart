import 'package:json_annotation/json_annotation.dart';
import 'package:sama/models/channel/channel.dart';

part 'option.g.dart';

@JsonSerializable()
class Option {
  int id;
  String name;
  int price;
  Channel subscribe;

  Option(this.id, this.name, this.price, this.subscribe);

  factory Option.fromJson(Map<String, dynamic> json) => _$OptionFromJson(json);

  /// Connect the generated [_$OptionToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$OptionToJson(this);
}
