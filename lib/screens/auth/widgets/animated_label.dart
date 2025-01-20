import 'package:flutter/material.dart';

Widget buildAnimatedLabel(String text) {
  return RichText(
    text: TextSpan(
      children: [
        TextSpan(
          text: text,
          style: const TextStyle(
            color: Colors.black87,
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
        const TextSpan(
          text: ' *',
          style: TextStyle(
            color: Colors.red,
            fontSize: 14,
          ),
        ),
      ],
    ),
  );
}
