import 'package:json_annotation/json_annotation.dart';

part 'eightball_response.g.dart';

@JsonSerializable()
class EightballResponse {
  final String? reading;

  const EightballResponse(
    this.reading,
  );

  factory EightballResponse.fromJson(Map<String, dynamic> json) =>
      _$EightballResponseFromJson(json);

  Map<String, dynamic> toJson() => _$EightballResponseToJson(this);
}
