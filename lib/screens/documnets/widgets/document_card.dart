import 'package:flutter/material.dart';
import 'package:flutter_application_1/const/theme.dart';
import 'package:flutter_application_1/screens/documnets/document_details_screen.dart';
import 'package:flutter_application_1/tools/utils/const_tools.dart';
import 'package:flutter_application_1/tools/utils/extentions.dart';

import '../../../models/documnet_model.dart';

class DocumentCard extends StatelessWidget {
  final DocumentModel document;
  final bool canTap;

  const DocumentCard({
    super.key,
    required this.document,
    required this.canTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: !canTap
          ? null
          : () {
              push(
                  context,
                  DocumentDetailsScreen(
                    document: document,
                  ));
            },
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: const Color(0xFFE9E9E9), width: 1),
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    'Contract #${document.id}',
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: AppColors.primary,
                    ),
                  ),
                ),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: document.getStatusColor(),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Text(
                    DocumentModel.statusToString(document.status).capitalize(),
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    document.description,
                    style: const TextStyle(
                      fontSize: 14,
                      color: Color(0xFF808080),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {},
                  child: const Text(
                    'View file',
                    style: TextStyle(
                      fontSize: 12,
                      color: Color(0xFF808080),
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
