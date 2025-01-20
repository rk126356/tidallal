import 'package:flutter/material.dart';
import 'package:flutter_application_1/const/theme.dart';
import 'package:flutter_application_1/screens/documnets/documents_screen.dart';
import 'package:flutter_application_1/tools/utils/const_tools.dart';

import '../../models/documnet_model.dart';
import '../../models/invoice_model.dart';
import '../documnets/widgets/document_card.dart';
import '../invoices/widgets/invoice_card.dart';
import 'widgets/client_home_stats.dart';

class ClientHome extends StatefulWidget {
  const ClientHome({super.key});

  @override
  State<ClientHome> createState() => _ClientHomeState();
}

class _ClientHomeState extends State<ClientHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset('assets/images/logo.png'),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
              onTap: () {},
              child: Container(
                height: 32,
                padding: const EdgeInsets.symmetric(horizontal: 22),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: const Center(
                  child: Text(
                    'Surveys',
                    style: TextStyle(
                      color: AppColors.primary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12),
          child: Column(
            children: [
              const ClientHomeStats(),
              const SizedBox(height: 14),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Documents',
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
              const SizedBox(height: 8),
              ...documents.map((document) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: DocumentCard(
                    document: document,
                    canTap: true,
                  ),
                );
              }),
              const SizedBox(height: 14),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Invoices',
                    style: AppTextStyles.heading,
                  ),
                  const Text(
                    'view all',
                    style: TextStyle(
                      color: Color(0xFF808080),
                    ),
                  ),
                ],
              ),
              ...invoices.map((invoice) {
                return Padding(
                  padding: const EdgeInsets.only(top: 8),
                  child: InvoiceCard(
                    invoice: invoice,
                    showDueDate: false,
                  ),
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}
