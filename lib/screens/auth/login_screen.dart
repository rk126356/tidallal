import 'package:flutter/material.dart';
import 'package:flutter_application_1/const/data.dart';
import 'package:flutter_application_1/const/theme.dart';
import 'package:flutter_application_1/screens/auth/reset_password_screen.dart';

import 'package:flutter_application_1/screens/navigation/bottom_navigation.dart';
import 'package:flutter_application_1/tools/utils/const_tools.dart';
import 'package:flutter_application_1/widgets/custom_button_widget.dart';

import '../../widgets/text_field_widget.dart';
import 'widgets/animated_label.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key, required this.isClientLogin});

  final bool isClientLogin;

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        title: Text(
          '${widget.isClientLogin ? 'Client' : 'Staff'} login',
          style: const TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),

              buildAnimatedLabel(
                widget.isClientLogin ? 'Mobile Number' : 'Username',
              ),
              const SizedBox(height: 8),
              buildTextFormField(
                hintText: widget.isClientLogin
                    ? 'Enter your mobile number'
                    : 'Username',
                prefixIcon: widget.isClientLogin
                    ? Icons.phone_android_sharp
                    : Icons.person,
                keyboardType: widget.isClientLogin
                    ? TextInputType.phone
                    : TextInputType.text,
              ),
              const SizedBox(height: 16),

              buildAnimatedLabel('Password'),
              const SizedBox(height: 8),
              buildTextFormField(
                hintText: 'Enter your password',
                prefixIcon: Icons.lock,
                obscureText: _obscureText,
                suffixIcon: IconButton(
                  icon: Icon(
                    _obscureText ? Icons.visibility_off : Icons.visibility,
                    color: const Color(0xFF404040),
                  ),
                  onPressed: () {
                    setState(() {
                      _obscureText = !_obscureText;
                    });
                  },
                ),
              ),

              // Reset Password Button
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {
                    push(context, const ResetPasswordScreen());
                  },
                  style: TextButton.styleFrom(
                    padding: EdgeInsets.zero,
                    minimumSize: const Size(0, 0),
                  ),
                  child: const Text(
                    'Reset password?',
                    style: TextStyle(
                      color: AppColors.primary,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 24),

              // Submit Button
              CustomButton(
                onPressed: () {
                  isClient = widget.isClientLogin;
                  pushReplaceAll(context, const CustomBottomNavigation());
                },
                text: 'Submit',
              ),

              // OR Divider
              const SizedBox(height: 20),
              const Row(
                children: [
                  Expanded(child: Divider()),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: Text('OR'),
                  ),
                  Expanded(child: Divider()),
                ],
              ),

              // Continue as Staff Button
              const SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                child: OutlinedButton(
                  onPressed: () {
                    pushReplace(context,
                        LoginScreen(isClientLogin: !widget.isClientLogin));
                  },
                  style: OutlinedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    side: const BorderSide(color: AppColors.primary),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: Text(
                    'Continue as ${widget.isClientLogin ? 'Staff' : 'Client'}',
                    style: const TextStyle(
                      color: AppColors.primary,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
