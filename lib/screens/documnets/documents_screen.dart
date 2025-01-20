import 'package:flutter/material.dart';
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
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12),
        child: ListView.builder(
          itemCount: allDocuments.length,
          itemBuilder: (context, index) {
            final document = allDocuments[index];
            return Padding(
              padding: const EdgeInsets.only(top: 8),
              child: DocumentCard(
                document: document,
                canTap: true,
              ),
            );
          },
        ),
      ),
    );
  }
}
