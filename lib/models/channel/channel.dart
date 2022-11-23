import 'package:json_annotation/json_annotation.dart';

part 'channel.g.dart';

@JsonSerializable()
class Channel {
  int id;
  String name;
  String type;
  int price;

  Channel(
    this.id,
    this.name,
    this.price,
    this.type,
  );

  factory Channel.fromJson(Map<String, dynamic> json) => _$ChannelFromJson(json);

  /// Connect the generated [_$ChannelToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$ChannelToJson(this);
}
