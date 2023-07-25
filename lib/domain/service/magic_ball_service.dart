import 'package:surf_practice_magic_ball/data/repository/magic_ball_repository.dart';
import 'package:surf_practice_magic_ball/domain/entity/fortune.dart';
import 'package:surf_practice_magic_ball/domain/service/fortune_service.dart';

const _emptyAnswer = 'Будущего нет';

class MagicBallService implements FortuneService {
  final MagicBallRepository _repository;

  const MagicBallService({
    required MagicBallRepository repository,
  }) : _repository = repository;

  @override
  Future<Fortune> getFortune() async {
    try {
      final result = await _repository.getFortuneResponse();
      return FortuneResult(result.reading ?? _emptyAnswer);
    } catch (e, st) {
      return FortuneError(e, st);
    }
  }
}
