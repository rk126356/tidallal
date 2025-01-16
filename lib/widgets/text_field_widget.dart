import 'package:flutter/material.dart';

import '../const/theme.dart';

Widget buildTextFormField({
  required String hintText,
  IconData? prefixIcon,
  TextInputType? keyboardType,
  bool obscureText = false,
  Widget? suffixIcon,
}) {
  return TextFormField(
    keyboardType: keyboardType,
    obscureText: obscureText,
    decoration: InputDecoration(
      hintText: hintText,
      filled: true,
      fillColor: Colors.white,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(color: Color(0xFFE9E9E9), width: 1),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(color: Color(0xFFE9E9E9), width: 1),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(color: AppColors.primary),
      ),
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      prefixIcon: prefixIcon != null
          ? Icon(
              prefixIcon,
              color: AppColors.primary,
            )
          : null,
      suffixIcon: suffixIcon,
    ),
  );
}
