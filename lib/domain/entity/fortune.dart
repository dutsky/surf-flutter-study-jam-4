/// Предсказание.
sealed class Fortune {}

/// Предсказание с текстом.
class FortuneResult implements Fortune {
  final String text;

  const FortuneResult(
    this.text,
  );
}

/// Ошибка предсказания.
class FortuneError implements Fortune {
  final Object error;
  final StackTrace stackTrace;

  const FortuneError(
    this.error,
    this.stackTrace,
  );
}

/// Загрузка предсказания.
class FortuneLoading implements Fortune {}
