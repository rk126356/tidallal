import 'package:flutter/material.dart';
import 'package:flutter_application_1/const/theme.dart';
import 'package:flutter_application_1/models/invoice_model.dart';
import 'package:flutter_application_1/models/receipts_model.dart';
import 'package:flutter_application_1/screens/invoices/widgets/invoice_card.dart';
import 'package:flutter_application_1/screens/invoices/widgets/receipt_card.dart';
import 'package:flutter_application_1/widgets/custom_button_widget.dart';

import 'widgets/amount_pay_popup.dart';

class InvoiceDetailsScreen extends StatefulWidget {
  const InvoiceDetailsScreen({super.key, required this.invoice});

  final InvoiceModel invoice;

  @override
  State<InvoiceDetailsScreen> createState() => _InvoiceDetailsScreenState();
}

class _InvoiceDetailsScreenState extends State<InvoiceDetailsScreen> {
  late InvoiceModel invoice;
  late TextEditingController _amountController;

  @override
  void initState() {
    super.initState();
    invoice = widget.invoice;
    _amountController =
        TextEditingController(text: invoice.dueAmount.toString());
  }

  @override
  void dispose() {
    _amountController.dispose();
    super.dispose();
  }

  void _showPaymentBottomSheet() {
    PaymentBottomSheet.payNow(context, _amountController);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        iconTheme: const IconThemeData(color: Colors.white),
        centerTitle: true,
        title: Text(
          invoice.id,
          style: AppTextStyles.screenTitle,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            InvoiceCard(
              invoice: invoice,
              showDueDate: true,
              isInside: true,
            ),
            const SizedBox(height: 16),
            Text(
              'Receipts',
              style: AppTextStyles.heading,
            ),
            Expanded(
              child: ListView.builder(
                itemCount: receipts.length,
                itemBuilder: (context, index) {
                  final receipt = receipts[index];
                  return Padding(
                    padding: const EdgeInsets.only(top: 8),
                    child: ReceiptCard(
                      receipt: receipt,
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 16),
            CustomButton(text: 'Pay now', onPressed: _showPaymentBottomSheet)
          ],
        ),
      ),
    );
  }
}
