import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_application_1/const/theme.dart';
import 'package:flutter_application_1/models/project_model.dart';
import 'package:flutter_application_1/screens/documnets/documents_screen.dart';
import 'package:flutter_application_1/screens/home/widgets/staff_home_stats.dart';
import 'package:flutter_application_1/screens/projects/project_details_screen.dart';
import 'package:flutter_application_1/screens/projects/widgets/project_card.dart';
import 'package:flutter_application_1/tools/utils/const_tools.dart';

class StaffHome extends StatefulWidget {
  const StaffHome({super.key});

  @override
  State<StaffHome> createState() => _StaffHomeState();
}

class _StaffHomeState extends State<StaffHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        centerTitle: true,
        title: Image.asset(
          'assets/images/logo.png',
          height: 40,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12),
          child: Column(
            children: [
              const StaffHomeStats(),
              const SizedBox(height: 14),
              Animate(
                effects: [
                  FadeEffect(duration: 300.ms),
                  SlideEffect(
                    duration: 300.ms,
                    begin: const Offset(0, -0.1),
                    end: const Offset(0, 0),
                  ),
                ],
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Assigned tasks',
                      style: AppTextStyles.heading,
                    ),
                    InkWell(
                      onTap: () {
                        push(context, const DocumentsScreen());
                      },
                      child: const Text(
                        'view all',
                        style: TextStyle(
                          color: Color(0xFF808080),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 8),
              ...projects.asMap().entries.map((entry) {
                final index = entry.key;
                final project = entry.value;
                return Animate(
                  effects: [
                    FadeEffect(delay: 100.ms * index, duration: 300.ms),
                    SlideEffect(
                      delay: 100.ms * index,
                      duration: 300.ms,
                      begin: const Offset(0, 0.1),
                      end: const Offset(0, 0),
                    ),
                  ],
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: ProjectCard(
                      project: project,
                      canTap: true,
                    ),
                  ),
                );
              }),
              const SizedBox(height: 14),
            ],
          ),
        ),
      ),
    );
  }
}
