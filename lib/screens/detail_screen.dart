import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../models/cat.dart';

class DetailScreen extends StatelessWidget {
  final Cat cat;
  const DetailScreen({super.key, required this.cat});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          cat.breedName,
          style: Theme.of(context).appBarTheme.titleTextStyle,
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildCatImage(context),
            const SizedBox(height: 24),
            _buildDetailSection(
              context,
              Icons.description,
              'Описание',
              cat.description,
            ),
            _buildDetailSection(
              context,
              Icons.psychology,
              'Характер',
              cat.temperament,
            ),
            _buildDetailSection(
              context,
              Icons.place,
              'Происхождение',
              cat.origin,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCatImage(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(24),
      child: CachedNetworkImage(
        imageUrl: cat.imageUrl,
        width: double.infinity,
        fit: BoxFit.cover,
        placeholder:
            (_, __) => Center(
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(
                  Theme.of(context).primaryColor,
                ),
              ),
            ),
        errorWidget: (_, __, ___) => const Icon(Icons.error, size: 40),
      ),
    );
  }

  Widget _buildDetailSection(
    BuildContext context,
    IconData icon,
    String title,
    String content,
  ) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(icon, color: Theme.of(context).iconTheme.color),
              const SizedBox(width: 8),
              Text(
                title,
                style: Theme.of(
                  context,
                ).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(content, style: Theme.of(context).textTheme.bodyMedium),
        ],
      ),
    );
  }
}
