import 'package:flutter/material.dart';

class ErrorPlaceholder extends StatelessWidget {
  final VoidCallback onRetry;

  const ErrorPlaceholder({super.key, required this.onRetry});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Ошибка загрузки данных",
            style: Theme.of(context).textTheme.bodyMedium,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16),
          ElevatedButton(onPressed: onRetry, child: const Text("Повторить")),
        ],
      ),
    );
  }
}
