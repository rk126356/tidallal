import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/auth/initial_language_select_screen.dart';
import 'package:flutter_application_1/const/theme.dart';
import 'package:flutter_application_1/tools/utils/const_tools.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void _waitAndNavigate() async {
    await Future.delayed(const Duration(seconds: 2));
    if (mounted) {
      pushReplaceAll(context, const InitialLanguageSelectScreen());
    }
  }

  @override
  void initState() {
    super.initState();
    _waitAndNavigate();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.primary,
      child: Center(
        child: Image.asset(
          'assets/images/logo.png',
        ),
      ),
    );
  }
}
