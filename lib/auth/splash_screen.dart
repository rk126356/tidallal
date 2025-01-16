import 'package:flutter/material.dart';
import 'package:flutter_application_1/auth/login_screen.dart';
import 'package:flutter_application_1/const/theme.dart';
import 'package:flutter_application_1/screens/navigation/bottom_navigation.dart';
import 'package:flutter_application_1/tools/const_tools.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void _waitAndNavigate() async {
    await Future.delayed(const Duration(seconds: 2));
    pushReplaceAll(context, const LoginScreen());
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
