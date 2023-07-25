import 'package:surf_practice_magic_ball/data/api/magic_ball_response.dart';

/// Репозиторий для работы с API магического шара.
abstract interface class MagicBallRepository {
  /// Получает ответ магического шара.
  Future<MagicBallResponse> getFortuneResponse();
}
