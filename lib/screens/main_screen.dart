import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../controllers/cat_controller.dart';
import '../themes/app_theme.dart';
import '../widgets/cat_card.dart';
import '../widgets/error_placeholder.dart';
import '../widgets/loading_indicator.dart';
import '../widgets/like_button.dart';
import '../widgets/dislike_button.dart';

class MainScreen extends StatelessWidget {
  final VoidCallback onToggleTheme;
  const MainScreen({super.key, required this.onToggleTheme});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      body: Consumer<CatController>(
        builder: (context, controller, _) {
          if (controller.hasError)
            return ErrorPlaceholder(onRetry: controller.reset);
          if (controller.cats.isEmpty) return const LoadingIndicator();
          return Column(
            children: [
              Expanded(
                child: CatCard(
                  cat: controller.cats.first,
                  onSwipe: (isLiked) => controller.handleSwipe(isLiked),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16),
                child: Text(
                  controller.cats.first.breedName,
                  style: Theme.of(context).appBarTheme.titleTextStyle,
                ),
              ),
              _buildFooter(context, controller),
            ],
          );
        },
      ),
    );
  }

  AppBar _buildAppBar(BuildContext context) {
    return AppBar(
      title: const Text('Cat Tinder'),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(bottom: Radius.circular(40)),
      ),
      bottom: const PreferredSize(
        preferredSize: Size.fromHeight(15),
        child: SizedBox(height: 8),
      ),
      actions: [
        IconButton(
          icon: const Icon(Icons.brightness_6),
          onPressed: onToggleTheme,
        ),
      ],
    );
  }

  Widget _buildFooter(BuildContext context, CatController controller) {
    final likesText =
        controller.likesCount > 10000 ? '∞' : controller.likesCount.toString();
    final brightness = Theme.of(context).brightness;
    final footerStyle =
        brightness == Brightness.dark
            ? AppTheme.footerTextDark
            : AppTheme.footerTextLight;
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 12, 16, 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 8),
            child: DislikeButton(
              onPressed: () => controller.handleSwipe(false),
            ),
          ),
          Text('Лайков: $likesText', style: footerStyle),
          Padding(
            padding: const EdgeInsets.only(right: 8),
            child: LikeButton(onPressed: () => controller.handleSwipe(true)),
          ),
        ],
      ),
    );
  }
}
