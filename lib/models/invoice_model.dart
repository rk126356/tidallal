import 'package:flutter/material.dart';

enum InvoiceStatus { due, pending, paid }

class InvoiceModel {
  final String id;
  final InvoiceStatus status;
  final String date;
  final String dueDate;
  final String contract;
  final double amount;
  final double paidAmount;
  final double dueAmount;

  InvoiceModel({
    required this.id,
    required this.status,
    required this.date,
    required this.dueDate,
    required this.contract,
    required this.amount,
    required this.paidAmount,
    required this.dueAmount,
  });

  // Factory constructor to create an InvoiceModel from a Map
  factory InvoiceModel.fromJson(Map<String, dynamic> json) {
    return InvoiceModel(
      id: json['id'] as String,
      status: _parseStatus(json['status'] as String),
      date: json['date'] as String,
      dueDate: json['due_date'] as String,
      contract: json['contract'] as String,
      amount: (json['amount'] as num).toDouble(),
      paidAmount: (json['paid_amount'] as num).toDouble(),
      dueAmount: (json['due_amount'] as num).toDouble(),
    );
  }

  // Method to convert InvoiceModel to a Map
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'status': statusToString(status),
      'date': date,
      'due_date': dueDate,
      'contract': contract,
      'amount': amount,
      'paid_amount': paidAmount,
      'due_amount': dueAmount,
    };
  }

  static InvoiceStatus _parseStatus(String status) {
    switch (status.toLowerCase()) {
      case 'due':
        return InvoiceStatus.due;
      case 'pending':
        return InvoiceStatus.pending;
      case 'paid':
        return InvoiceStatus.paid;
      default:
        throw ArgumentError('Invalid status: $status');
    }
  }

  static String statusToString(InvoiceStatus status) {
    switch (status) {
      case InvoiceStatus.due:
        return 'Due';
      case InvoiceStatus.pending:
        return 'Pending';
      case InvoiceStatus.paid:
        return 'Paid';
    }
  }

  Color getStatusColor() {
    switch (status) {
      case InvoiceStatus.due:
        return Colors.red;
      case InvoiceStatus.pending:
        return Colors.orange;
      case InvoiceStatus.paid:
        return Colors.green;
    }
  }
}

List<InvoiceModel> invoices = [
  InvoiceModel(
    id: 'INV - TD001',
    status: InvoiceStatus.pending,
    date: '23-10-2023',
    dueDate: '23-10-2023',
    contract: '#090900',
    amount: 22000,
    paidAmount: 0,
    dueAmount: 22000,
  ),
  InvoiceModel(
    id: 'INV - TD002',
    status: InvoiceStatus.paid,
    date: '23-10-2023',
    dueDate: '23-10-2023',
    contract: '#090901',
    amount: 22000,
    paidAmount: 22000,
    dueAmount: 0,
  ),
  InvoiceModel(
    id: 'INV - TD003',
    status: InvoiceStatus.due,
    date: '23-10-2023',
    dueDate: '23-10-2023',
    contract: '#090902',
    amount: 22000,
    paidAmount: 0,
    dueAmount: 22000,
  ),
  InvoiceModel(
    id: 'INV - TD004',
    status: InvoiceStatus.pending,
    date: '23-10-2023',
    dueDate: '23-10-2023',
    contract: '#090903',
    amount: 22000,
    paidAmount: 10000,
    dueAmount: 12000,
  ),
  InvoiceModel(
    id: 'INV - TD005',
    status: InvoiceStatus.paid,
    date: '23-10-2023',
    dueDate: '23-10-2023',
    contract: '#090904',
    amount: 22000,
    paidAmount: 22000,
    dueAmount: 0,
  ),
  InvoiceModel(
    id: 'INV - TD006',
    status: InvoiceStatus.due,
    date: '23-10-2023',
    dueDate: '23-10-2023',
    contract: '#090905',
    amount: 22000,
    paidAmount: 5000,
    dueAmount: 17000,
  ),
];
