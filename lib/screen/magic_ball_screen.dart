import 'package:flutter/material.dart';
import 'package:shake/shake.dart';
import 'package:surf_practice_magic_ball/domain/entity/fortune.dart';
import 'package:surf_practice_magic_ball/domain/service/fortune_service.dart';
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

  @override
  void initState() {
    super.initState();
    fortune = ValueNotifier(null);
    shakeDetector = ShakeDetector.autoStart(
      onPhoneShake: _askReading,
    );
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
          const Positioned(
            bottom: 24.0,
            child: Text(
              'Нажмите или потрясите телефон',
              style: TextStyle(
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
