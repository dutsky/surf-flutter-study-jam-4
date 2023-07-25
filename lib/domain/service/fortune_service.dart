import 'package:surf_practice_magic_ball/domain/entity/fortune.dart';

/// Сервис для работы с предсказаниями.
abstract interface class FortuneService {
  /// Получить предсказние.
  Future<Fortune> getFortune();
}
