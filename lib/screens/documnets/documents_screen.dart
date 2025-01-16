import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_application_1/const/theme.dart';
import 'package:flutter_application_1/models/documnet_model.dart';
import 'package:flutter_application_1/screens/documnets/widgets/document_card.dart';

class DocumentsScreen extends StatefulWidget {
  const DocumentsScreen({super.key});

  @override
  State<DocumentsScreen> createState() => _DocumentsScreenState();
}

class _DocumentsScreenState extends State<DocumentsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        iconTheme: const IconThemeData(color: Colors.white),
        centerTitle: true,
        title: Text(
          'Documents',
          style: AppTextStyles.screenTitle,
        ),
      ),
      body: ListView.builder(
        itemCount: allDocuments.length,
        itemBuilder: (context, index) {
          final document = allDocuments[index];
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
              child: DocumentCard(
                document: document,
              ),
            ),
          );
        },
      ),
    );
  }
}
