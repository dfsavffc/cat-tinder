import 'package:flutter/material.dart';

class LoadingIndicator extends StatelessWidget {
  const LoadingIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Image.asset('assets/images/loading_cat.png', fit: BoxFit.contain),
    );
  }
}
