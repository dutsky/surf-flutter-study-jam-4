import 'package:surf_practice_magic_ball/data/api/eightball_api.dart';
import 'package:surf_practice_magic_ball/data/api/eightball_response.dart';
import 'package:surf_practice_magic_ball/data/repository/magic_ball_repository.dart';

class EightballRepository implements MagicBallRepository {
  final EightballApi _api;

  const EightballRepository({required EightballApi api}) : _api = api;

  @override
  Future<EightballResponse> getFortuneResponse() async {
    return _api.getRandomReading();
  }
}
