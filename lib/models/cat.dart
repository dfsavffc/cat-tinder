// lib/models/cat.dart

/// Модель данных, представляющая кота определенной породы.
/// Содержит информацию об изображении, названии породы, описании, темпераменте и происхождении.
class Cat {
  /// URL изображения кота.
  final String imageUrl;

  /// Название породы.
  final String breedName;

  /// Описание породы.
  final String description;

  /// Характерные особенности породы.
  final String temperament;

  /// Страна происхождения породы.
  final String origin;

  /// Создает экземпляр [Cat].
  const Cat({
    required this.imageUrl,
    required this.breedName,
    required this.description,
    required this.temperament,
    required this.origin,
  });

  /// Парсит объект из JSON.
  /// Выбрасывает [FormatException], если данные некорректны.
  factory Cat.fromJson(Map<String, dynamic> json) {
    try {
      final breed =
          (json['breeds'] as List?)?.firstWhere(
                (b) => b != null,
                orElse: () => {},
              )
              as Map<String, dynamic>;

      return Cat(
        imageUrl: json['url'] as String,
        breedName: _getValue(breed, 'name', 'Неизвестно'),
        description: _getValue(breed, 'description', 'Нет описания'),
        temperament: _getValue(breed, 'temperament', 'Не указан'),
        origin: _getValue(breed, 'origin', 'Не указан'),
      );
    } catch (e, stackTrace) {
      throw FormatException('Ошибка парсинга: $e', stackTrace);
    }
  }

  // Вспомогательный метод для безопасного получения строковых значений
  static String _getValue(
    Map<String, dynamic> map,
    String key,
    String fallback,
  ) {
    final value = map[key];
    return (value is String && value.isNotEmpty) ? value : fallback;
  }

  /// Преобразует объект в JSON.
  Map<String, dynamic> toJson() => {
    'url': imageUrl,
    'breeds': [
      {
        'name': breedName,
        'description': description,
        'temperament': temperament,
        'origin': origin,
      },
    ],
  };

  @override
  String toString() => 'Порода: $breedName ($origin)';
}
