import 'package:surf_practice_magic_ball/domain/service/fortune_service.dart';

/// Зависимости уровня приложения.
class AppScope {
  final FortuneService fortuneService;

  const AppScope(this.fortuneService);
}
