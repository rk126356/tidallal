import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

Widget buildAnimatedWidget(Widget child, {required int delay}) {
  return child
      .animate(delay: Duration(milliseconds: delay))
      .fadeIn(duration: 500.ms)
      .slideX(begin: 0.2, end: 0, duration: 500.ms, curve: Curves.easeOutQuad);
}
