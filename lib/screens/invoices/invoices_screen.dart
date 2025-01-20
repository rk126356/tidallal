import 'package:flutter/material.dart';
import 'package:flutter_application_1/const/theme.dart';
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
                  return Padding(
                    padding: const EdgeInsets.only(top: 8),
                    child: InvoiceCard(
                      invoice: invoice,
                      showDueDate: false,
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
