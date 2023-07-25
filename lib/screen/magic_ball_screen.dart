import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:shake/shake.dart';
import 'package:surf_practice_magic_ball/domain/entity/fortune.dart';
import 'package:surf_practice_magic_ball/domain/service/fortune_service.dart';
import 'package:surf_practice_magic_ball/screen/magic_ball_strings.dart';
import 'package:surf_practice_magic_ball/screen/widgets/kirkle.dart';

class MagicBallScreen extends StatefulWidget {
  final FortuneService service;

  const MagicBallScreen({required this.service, super.key});

  @override
  State<MagicBallScreen> createState() => _MagicBallScreenState();
}

class _MagicBallScreenState extends State<MagicBallScreen> {
  late final ValueNotifier<Fortune?> fortune;
  late final ShakeDetector shakeDetector;
  late final bool isDesktop;

  @override
  void initState() {
    super.initState();
    fortune = ValueNotifier(null);
    shakeDetector = ShakeDetector.autoStart(
      onPhoneShake: _askReading,
    );
    isDesktop = (defaultTargetPlatform == TargetPlatform.linux) ||
        (defaultTargetPlatform == TargetPlatform.macOS) ||
        (defaultTargetPlatform == TargetPlatform.windows);
  }

  @override
  void dispose() {
    shakeDetector.stopListening();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.all(48.0),
              child: GestureDetector(
                onTap: _askReading,
                child: ValueListenableBuilder<Fortune?>(
                  valueListenable: fortune,
                  builder: (_, value, __) => switch (value) {
                    null => Kirkle.initial(),
                    FortuneLoading() => Kirkle.loading(),
                    FortuneError() => Kirkle.error(),
                    FortuneResult(text: final text) => Kirkle.answer(text),
                  },
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 24.0,
            child: Text(
              isDesktop
                  ? MagicBallStrings.press
                  : MagicBallStrings.shakeOrPress,
              style: const TextStyle(
                fontSize: 16.0,
                color: Colors.blueGrey,
                fontStyle: FontStyle.italic,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _askReading() async {
    fortune.value = FortuneLoading();
    fortune.value = await widget.service.getFortune();
  }
}
