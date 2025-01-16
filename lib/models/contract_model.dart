import 'package:flutter/material.dart';

enum ContractStstus { active, canceled, completed }

class ContractModel {
  final String id;
  final ContractStstus status;
  final String startDate;
  final String endDate;
  final double amount;

  ContractModel({
    required this.id,
    required this.status,
    required this.startDate,
    required this.endDate,
    required this.amount,
  });

  factory ContractModel.fromJson(Map<String, dynamic> json) {
    return ContractModel(
      id: json['id'] as String,
      status: parseStatus(json['status'] as String),
      startDate: json['startDate'] as String,
      endDate: json['endDate'] as String,
      amount: json['amount'] as double,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'status': statusToString(status),
      'startDate': startDate,
      'endDate': endDate,
      'amount': amount,
    };
  }

  static ContractStstus parseStatus(String status) {
    switch (status.toLowerCase()) {
      case 'active':
        return ContractStstus.active;
      case 'canceled':
        return ContractStstus.canceled;
      case 'completed':
        return ContractStstus.completed;
      default:
        throw ArgumentError('Invalid status: $status');
    }
  }

  static String statusToString(ContractStstus status) {
    switch (status) {
      case ContractStstus.active:
        return 'active';
      case ContractStstus.canceled:
        return 'canceled';
      case ContractStstus.completed:
        return 'completed';
    }
  }

  Color getStatusColor() {
    switch (status) {
      case ContractStstus.canceled:
        return Colors.red;
      case ContractStstus.active:
        return Colors.orange;
      case ContractStstus.completed:
        return Colors.green;
    }
  }
}

List<ContractModel> contracts = [
  ContractModel(
    id: '090900',
    status: ContractStstus.active,
    startDate: '2023-06-01',
    endDate: '2024-05-31',
    amount: 50000.00,
  ),
  ContractModel(
    id: '090900',
    status: ContractStstus.completed,
    startDate: '2023-07-15',
    endDate: '2023-12-31',
    amount: 15000.00,
  ),
  ContractModel(
    id: '090900',
    status: ContractStstus.canceled,
    startDate: '2023-09-01',
    endDate: '2024-08-31',
    amount: 36000.00,
  ),
  ContractModel(
    id: '090900',
    status: ContractStstus.active,
    startDate: '2023-08-01',
    endDate: '2024-07-31',
    amount: 75000.00,
  ),
  ContractModel(
    id: '090900',
    status: ContractStstus.completed,
    startDate: '2023-06-15',
    endDate: '2025-06-14',
    amount: 0.00,
  ),
  ContractModel(
    id: '090900',
    status: ContractStstus.active,
    startDate: '2023-10-01',
    endDate: '2024-03-31',
    amount: 30000.00,
  ),
];
