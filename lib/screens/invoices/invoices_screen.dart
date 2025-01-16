import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_application_1/const/theme.dart';
import 'package:flutter_application_1/screens/invoices/invoice_details_screen.dart';
import 'package:flutter_application_1/tools/const_tools.dart';
import 'package:flutter_application_1/widgets/heading_with_icon_widget.dart';

import '../../models/invoice_model.dart';
import 'widgets/invoice_card.dart';

class MyInvoicesScreen extends StatefulWidget {
  const MyInvoicesScreen({super.key});

  @override
  State<MyInvoicesScreen> createState() => _MyInvoicesScreenState();
}

class _MyInvoicesScreenState extends State<MyInvoicesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        centerTitle: true,
        title: Text(
          'My Invoices',
          style: AppTextStyles.screenTitle,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12),
        child: Column(
          children: [
            const HeadingWithIconWidget(
                title: 'Filter', iconPath: 'assets/icons/filter.svg'),
            Expanded(
              child: ListView.builder(
                itemCount: invoices.length,
                itemBuilder: (context, index) {
                  final invoice = invoices[index];
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
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
