import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_application_1/const/theme.dart';
import 'package:flutter_application_1/models/project_model.dart';
import 'package:flutter_application_1/screens/projects/widgets/project_card.dart';

class ActiveProjectsScreen extends StatefulWidget {
  const ActiveProjectsScreen({super.key});

  @override
  State<ActiveProjectsScreen> createState() => _ActiveProjectsScreenState();
}

class _ActiveProjectsScreenState extends State<ActiveProjectsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        iconTheme: const IconThemeData(color: Colors.white),
        title: Text(
          'Active Projects',
          style: AppTextStyles.screenTitle,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12),
        child: ListView.builder(
          itemCount: projects.length,
          itemBuilder: (context, index) {
            final project = projects[index];
            return Animate(
              effects: [
                FadeEffect(delay: 100.ms * index, duration: 300.ms),
                SlideEffect(
                  delay: 100.ms * index,
                  duration: 300.ms,
                  begin: const Offset(0.1, 0),
                  end: const Offset(0, 0),
                ),
              ],
              child: Padding(
                padding: const EdgeInsets.only(top: 8),
                child: ProjectCard(
                  project: project,
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
