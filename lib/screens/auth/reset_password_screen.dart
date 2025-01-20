import 'package:flutter/material.dart';
import 'package:flutter_application_1/const/theme.dart';

import '../../widgets/custom_button_widget.dart';
import '../../widgets/text_field_widget.dart';
import 'widgets/animated_label.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({super.key});

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  bool _obscureText = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        iconTheme: const IconThemeData(color: Colors.white),
        centerTitle: true,
        title: Text(
          'Reset Password',
          style: AppTextStyles.screenTitle,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
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
              const SizedBox(height: 16),
              buildAnimatedLabel('Confirm password'),
              const SizedBox(height: 8),
              buildTextFormField(
                hintText: 'Confirm your password',
                prefixIcon: Icons.lock,
                obscureText: _obscureText,
              ),
              const SizedBox(height: 24),

              // Submit Button
              CustomButton(
                onPressed: () {},
                text: 'Submit',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
