import 'package:json_annotation/json_annotation.dart';
import 'package:surf_practice_magic_ball/data/api/magic_ball_response.dart';

part 'eightball_response.g.dart';

@JsonSerializable()
class EightballResponse implements MagicBallResponse {
  @override
  final String? reading;

  const EightballResponse(
    this.reading,
  );

  factory EightballResponse.fromJson(Map<String, dynamic> json) =>
      _$EightballResponseFromJson(json);

  Map<String, dynamic> toJson() => _$EightballResponseToJson(this);
}
