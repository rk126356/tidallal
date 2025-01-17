import 'package:flutter/material.dart';
import 'package:flutter_application_1/const/theme.dart';
import 'package:flutter_application_1/models/invoice_model.dart';

import '../../../tools/utils/const_tools.dart';
import '../invoice_details_screen.dart';

class InvoiceCard extends StatelessWidget {
  final InvoiceModel invoice;
  final bool showDueDate;
  final bool isInside;

  const InvoiceCard({
    super.key,
    required this.invoice,
    required this.showDueDate,
    this.isInside = false,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        push(
            context,
            InvoiceDetailsScreen(
              invoice: invoice,
            ));
      },
      child: Card(
        elevation: 1,
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
          side: const BorderSide(color: Color(0xFFE9E9E9)),
        ),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    invoice.id,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: AppColors.primary,
                    ),
                  ),
                  _buildStatusChip(),
                ],
              ),
              const SizedBox(height: 12),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildInfoColumn('Date', invoice.date),
                  const SizedBox(
                    height: 4,
                  ),
                  _buildInfoColumn('Due date', invoice.dueDate),
                  const SizedBox(
                    height: 4,
                  ),
                  _buildInfoColumn('Contract', invoice.contract),
                  const SizedBox(
                    height: 4,
                  ),
                  _buildInfoColumn(isInside ? 'Total amount' : 'Amount',
                      '${invoice.amount} KD'),
                  if (isInside) ...[
                    _buildInfoColumn('Due amount', invoice.dueAmount.toString(),
                        color: AppColors.lightYellow),
                    const SizedBox(
                      height: 4,
                    ),
                    _buildInfoColumn(
                        'Paid amount', invoice.paidAmount.toString(),
                        color: AppColors.lightGreen),
                  ]
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildStatusChip() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: invoice.getStatusColor(),
        borderRadius: BorderRadius.circular(6),
      ),
      child: Text(
        InvoiceModel.statusToString(invoice.status),
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 12,
        ),
      ),
    );
  }

  Widget _buildInfoColumn(String label, String value,
      {Color color = Colors.black87}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 12,
            color: Colors.grey,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          value,
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: color,
          ),
        ),
      ],
    );
  }
}
