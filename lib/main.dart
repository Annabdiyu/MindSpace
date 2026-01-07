// lib/main.dart
import 'package:flutter/material.dart';
import 'package:mindspace/core/theme/app_theme.dart';
import 'package:mindspace/presentation/screens/onboarding_screen.dart';

void main() {
  runApp(const MindSpaceApp());
}

class MindSpaceApp extends StatelessWidget {
  const MindSpaceApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MindSpace',
      theme: AppTheme.lightTheme,
      debugShowCheckedModeBanner: false,
      home: const OnboardingScreen(),
    );
  }
}