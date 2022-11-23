import 'package:json_annotation/json_annotation.dart';
import 'package:sama/models/channel/channel.dart';

part 'terms.g.dart';

@JsonSerializable()
class Terms {
  int id;
  String term;
  int amount;
  Channel subscribe;

  Terms(
this.id, this.term, this.amount, this.subscribe
  );

  factory Terms.fromJson(Map<String, dynamic> json) => _$TermsFromJson(json);

  /// Connect the generated [_$TermsToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$TermsToJson(this);
}
