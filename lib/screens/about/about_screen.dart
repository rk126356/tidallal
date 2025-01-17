import 'package:flutter/material.dart';
import 'package:flutter_application_1/const/data.dart';
import 'package:flutter_application_1/const/theme.dart';
import 'package:flutter_application_1/screens/about/simple_text_screen.dart';
import 'package:flutter_application_1/tools/utils/const_tools.dart';

import '../../tools/view_tools/build_animated_widget.dart';
import '../../widgets/icon_title_outline_widget.dart';

class AboutScreen extends StatefulWidget {
  const AboutScreen({super.key});

  @override
  State<AboutScreen> createState() => _AboutScreenState();
}

class _AboutScreenState extends State<AboutScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.white),
        title: Text(
          'About Tidallal',
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
                  title: 'About',
                  iconPath: 'assets/icons/info.svg',
                  onPressed: () {
                    push(context,
                        SimpleTextScreen(text: aboutUs, title: 'About'));
                  },
                ),
                delay: 100,
              ),
              const SizedBox(height: 10),
              buildAnimatedWidget(
                IconTitleOutlineWidget(
                  title: 'Terms and conditions',
                  iconPath: 'assets/icons/terms.svg',
                  onPressed: () {
                    push(
                        context,
                        SimpleTextScreen(
                            text: termsAndConditions,
                            title: 'Terms and conditions'));
                  },
                ),
                delay: 200,
              ),
              const SizedBox(height: 10),
              buildAnimatedWidget(
                IconTitleOutlineWidget(
                  title: 'Privacy policy',
                  iconPath: 'assets/icons/lock.svg',
                  onPressed: () {
                    push(
                        context,
                        SimpleTextScreen(
                            text: privacyPolicy, title: 'Privacy policy'));
                  },
                ),
                delay: 300,
              ),
              const SizedBox(height: 40),
              buildAnimatedWidget(
                Row(
                  children: [
                    const Expanded(
                      child: Divider(
                        color: AppColors.borderColor,
                        thickness: 1,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Text(
                        'Stay connected with us',
                        style: AppTextStyles.body.copyWith(
                          color: AppColors.primary,
                        ),
                      ),
                    ),
                    const Expanded(
                      child: Divider(
                        color: AppColors.borderColor,
                        thickness: 1,
                      ),
                    ),
                  ],
                ),
                delay: 400,
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset('assets/images/instagram.png', height: 50),
                  // const SizedBox(width: 8),
                  Image.asset('assets/images/whatsapp.png', height: 50),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
