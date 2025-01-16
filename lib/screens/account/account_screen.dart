import 'package:flutter/material.dart';
import 'package:flutter_application_1/const/theme.dart';
import 'package:flutter_application_1/widgets/icon_title_outline_widget.dart';
import 'package:flutter_animate/flutter_animate.dart';

import '../../tools/const_tools.dart';
import '../../tools/view_tools/build_animated_widget.dart';
import '../about/about_screen.dart';

class MyAccountScreen extends StatefulWidget {
  const MyAccountScreen({super.key});

  @override
  State<MyAccountScreen> createState() => _MyAccountScreenState();
}

class _MyAccountScreenState extends State<MyAccountScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        centerTitle: true,
        title: Text(
          'My Account',
          style: AppTextStyles.screenTitle,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12),
          child: Column(
            children: [
              const SizedBox(height: 16),
              buildAnimatedWidget(
                IconTitleOutlineWidget(
                  title: 'Select language',
                  iconPath: 'assets/icons/globe.svg',
                  trailingText: 'English',
                  onPressed: () {},
                ),
                delay: 100,
              ),
              const SizedBox(height: 10),
              buildAnimatedWidget(
                IconTitleOutlineWidget(
                  title: 'Reset password',
                  iconPath: 'assets/icons/unlock.svg',
                  onPressed: () {},
                ),
                delay: 200,
              ),
              const SizedBox(height: 10),
              buildAnimatedWidget(
                IconTitleOutlineWidget(
                  title: 'About Us',
                  iconPath: 'assets/icons/info.svg',
                  onPressed: () {
                    push(context, const AboutScreen());
                  },
                ),
                delay: 300,
              ),
              const SizedBox(height: 10),
              buildAnimatedWidget(
                IconTitleOutlineWidget(
                  title: 'Feedback',
                  iconPath: 'assets/icons/chat.svg',
                  onPressed: () {},
                ),
                delay: 400,
              ),
              const SizedBox(height: 10),
              buildAnimatedWidget(
                IconTitleOutlineWidget(
                  title: 'Contact Us',
                  iconPath: 'assets/icons/headphone.svg',
                  onPressed: () {},
                ),
                delay: 500,
              ),
              const SizedBox(height: 10),
              buildAnimatedWidget(
                IconTitleOutlineWidget(
                  title: 'Logout',
                  iconPath: 'assets/icons/exit.svg',
                  onPressed: () {},
                  isRedBg: true,
                ),
                delay: 600,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
