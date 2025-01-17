import 'package:flutter/material.dart';
import 'package:flutter_application_1/const/theme.dart';

class SimpleTextScreen extends StatefulWidget {
  const SimpleTextScreen({super.key, required this.text, required this.title});
  final String text;
  final String title;

  @override
  State<SimpleTextScreen> createState() => _SimpleTextScreenState();
}

class _SimpleTextScreenState extends State<SimpleTextScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: AppColors.primary,
        centerTitle: true,
        title: Text(
          widget.title,
          style: AppTextStyles.screenTitle,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
          child: Column(
            children: [
              Text(
                widget.text,
                style: const TextStyle(
                  fontSize: 16,
                  color: AppColors.lightBlack,
                  height: 1.5,
                ),
                textAlign: TextAlign.justify,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
