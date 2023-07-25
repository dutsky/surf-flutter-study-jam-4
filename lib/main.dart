import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:surf_practice_magic_ball/app_scope.dart';
import 'package:surf_practice_magic_ball/data/api/eightball_api.dart';
import 'package:surf_practice_magic_ball/data/repository/eightball_repository.dart';
import 'package:surf_practice_magic_ball/domain/service/fortune_service.dart';
import 'package:surf_practice_magic_ball/domain/service/magic_ball_service.dart';
import 'package:surf_practice_magic_ball/screen/magic_ball_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final service = _initService();

  runApp(
    Provider(
      create: (_) => AppScope(service),
      child: const MyApp(),
    ),
  );
}

/// App,s main widget.
class MyApp extends StatelessWidget {
  /// Constructor for [MyApp].
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appScope = context.read<AppScope>();

    return MaterialApp(
      themeMode: ThemeMode.dark,
      theme: ThemeData(
        colorSchemeSeed: Colors.indigo,
        useMaterial3: true,
      ),
      darkTheme: ThemeData(
        colorSchemeSeed: Colors.indigo,
        useMaterial3: true,
        brightness: Brightness.dark,
      ),
      home: MagicBallScreen(service: appScope.fortuneService),
    );
  }
}

FortuneService _initService() {
  final dio = Dio();
  final api = EightballApi(dio);
  final repo = EightballRepository(api: api);
  return MagicBallService(repository: repo);
}
