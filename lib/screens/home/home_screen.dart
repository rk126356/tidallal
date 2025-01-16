import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_application_1/const/theme.dart';
import 'package:flutter_application_1/screens/documnets/documents_screen.dart';
import 'package:flutter_application_1/screens/invoices/invoice_details_screen.dart';
import 'package:flutter_application_1/tools/const_tools.dart';

import '../../models/contract_model.dart';
import '../../models/documnet_model.dart';
import '../../models/invoice_model.dart';
import '../documnets/widgets/document_card.dart';
import '../invoices/widgets/invoice_card.dart';
import 'widgets/home_stats.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
              const HomeStats(),
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
              ),
              const SizedBox(height: 8),
              ...documents.asMap().entries.map((entry) {
                final index = entry.key;
                final document = entry.value;
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
                    child: DocumentCard(document: document),
                  ),
                );
              }),
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
              ),
              ...invoices.asMap().entries.map((entry) {
                final index = entry.key;
                final invoice = entry.value;
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
                    child: InkWell(
                      onTap: () {
                        push(
                            context,
                            InvoiceDetailsScreen(
                              invoice: invoice,
                            ));
                      },
                      child: InvoiceCard(
                        invoice: invoice,
                        showDueDate: false,
                      ),
                    ),
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
