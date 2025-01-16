import 'package:flutter/material.dart';

class AppColors {
  static const Color primary = Color(0xFF0F214B);
  static const Color secondary = Color(0xFF1D1D1D);
  static const Color iconColor = Color(0xFF404040);
  static const Color lightYellow = Color(0xFFFFA500);
  static const Color lightGreen = Color(0xFF07B04B);
  static const Color borderColor = Color(0xFFE9E9E9);
}

class AppTextStyles {
  static TextStyle title = const TextStyle(fontSize: 24.0);
  static TextStyle body = const TextStyle(fontSize: 16.0);
  static TextStyle subheading = const TextStyle(fontSize: 14.0);
  static TextStyle button = const TextStyle(fontSize: 18.0);
  static TextStyle heading = const TextStyle(
    fontSize: 20,
    color: AppColors.primary,
    fontWeight: FontWeight.bold,
  );
  static TextStyle screenTitle =
      const TextStyle(color: Colors.white, fontWeight: FontWeight.bold);
}
