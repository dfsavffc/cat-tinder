import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'themes/app_theme.dart';
import 'screens/main_screen.dart';
import 'controllers/cat_controller.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => CatController()..initialize(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _isDarkTheme = true;

  void _toggleTheme() {
    setState(() {
      _isDarkTheme = !_isDarkTheme;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cat Tinder',
      debugShowCheckedModeBanner: false,
      theme: _isDarkTheme ? AppTheme.darkTheme : AppTheme.lightTheme,
      home: MainScreen(onToggleTheme: _toggleTheme),
    );
  }
}
