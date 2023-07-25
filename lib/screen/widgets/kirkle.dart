import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

const _errorColor = Colors.redAccent;
const _answerColor = Colors.indigo;

/// Кругляш по имени Киркле.
class Kirkle extends StatelessWidget {
  final Color color;
  final Widget? child;

  const Kirkle._({
    required this.child,
    this.color = _answerColor,
  });

  /// Начальный стейт кругляша.
  factory Kirkle.initial() => Kirkle._(
        child: null,
        color: _answerColor.shade900,
      );

  /// Стейт загрузки кругляша.
  factory Kirkle.loading() => Kirkle._(
        color: _answerColor.shade700,
        child: const CupertinoActivityIndicator(
          radius: 48.0,
        ),
      );

  /// Стейт ошибки кругляша.
  factory Kirkle.error() => const Kirkle._(
        color: _errorColor,
        child: Icon(
          Icons.error,
          color: _errorColor,
        ),
      );

  /// Стейт с ответом.
  factory Kirkle.answer(String text) => Kirkle._(
        child: Text(
          text,
          style: const TextStyle(
            color: _answerColor,
            fontSize: 24.0,
          ),
          textAlign: TextAlign.center,
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ShaderMask(
          shaderCallback: (bounds) => RadialGradient(
            radius: 0.76,
            colors: <Color>[Colors.black, color],
          ).createShader(bounds),
          child: const CircleAvatar(
            backgroundImage: AssetImage('stars.jpg'),
            radius: double.infinity,
          ),
        ),
        if (child != null) Center(child: child),
      ],
    );
  }
}
