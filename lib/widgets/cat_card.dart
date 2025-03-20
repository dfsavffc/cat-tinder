import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../models/cat.dart';
import 'loading_indicator.dart'; // Импортируем виджет загрузки

class CatCard extends StatelessWidget {
  final Cat cat;
  final Function(bool) onSwipe;

  const CatCard({super.key, required this.cat, required this.onSwipe});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showModalBottomSheet(
          context: context,
          isDismissible: true,
          isScrollControlled: true,
          backgroundColor: Theme.of(context).bottomSheetTheme.backgroundColor,
          shape: Theme.of(context).bottomSheetTheme.shape,
          builder: (context) {
            return DraggableScrollableSheet(
              expand: false,
              initialChildSize: 0.5,
              minChildSize: 0.3,
              maxChildSize: 0.8,
              builder: (context, scrollController) {
                return SingleChildScrollView(
                  controller: scrollController,
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Center(
                          child: Container(
                            width: 40,
                            height: 4,
                            decoration: BoxDecoration(
                              color: Colors.grey[400],
                              borderRadius: BorderRadius.circular(2),
                            ),
                          ),
                        ),
                        const SizedBox(height: 16),
                        Text(
                          cat.breedName,
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                        const SizedBox(height: 16),
                        // Секция "Описание" с обновлённой иконкой
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Icon(
                              Icons.pets,
                              color: Theme.of(context).iconTheme.color,
                            ),
                            const SizedBox(width: 8),
                            Text(
                              "Описание",
                              style: Theme.of(context).textTheme.bodyMedium
                                  ?.copyWith(fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        const SizedBox(height: 4),
                        Text(
                          cat.description,
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                        const SizedBox(height: 16),
                        // Секция "Характер" с обновлённой иконкой
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Icon(
                              Icons.face,
                              color: Theme.of(context).iconTheme.color,
                            ),
                            const SizedBox(width: 8),
                            Text(
                              "Характер",
                              style: Theme.of(context).textTheme.bodyMedium
                                  ?.copyWith(fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        const SizedBox(height: 4),
                        Text(
                          cat.temperament,
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                        const SizedBox(height: 16),
                        // Секция "Происхождение" с обновлённой иконкой
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Icon(
                              Icons.location_on,
                              color: Theme.of(context).iconTheme.color,
                            ),
                            const SizedBox(width: 8),
                            Text(
                              "Происхождение",
                              style: Theme.of(context).textTheme.bodyMedium
                                  ?.copyWith(fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        const SizedBox(height: 4),
                        Text(
                          cat.origin,
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                        const SizedBox(height: 16),
                      ],
                    ),
                  ),
                );
              },
            );
          },
        );
      },
      onHorizontalDragEnd: (details) {
        if (details.primaryVelocity! > 0) onSwipe(true);
        if (details.primaryVelocity! < 0) onSwipe(false);
      },
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(36),
          // увеличенное скругление изображения
          child: CachedNetworkImage(
            imageUrl: cat.imageUrl,
            fit: BoxFit.cover,
            fadeOutDuration: Duration.zero,
            // убираем анимацию затухания
            placeholder: (_, __) => const LoadingIndicator(),

            // используем кастомный LoadingIndicator
            errorWidget: (_, __, ___) => const Icon(Icons.error, size: 40),
          ),
        ),
      ),
    );
  }
}
