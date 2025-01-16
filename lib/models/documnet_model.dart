import 'package:flutter/material.dart';

enum DocumentStatus {
  pending,
  rejected,
  success,
}

class DocumentModel {
  final String id;
  final DocumentStatus status;
  final String description;
  final String fileUrl;

  DocumentModel({
    required this.id,
    required this.status,
    required this.description,
    required this.fileUrl,
  });

  factory DocumentModel.fromJson(Map<String, dynamic> json) {
    return DocumentModel(
      id: json['id'] as String,
      status: parseStatus(json['status'] as String),
      description: json['description'] as String,
      fileUrl: json['fileUrl'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'status': statusToString(status),
      'description': description,
      'fileUrl': fileUrl,
    };
  }

  static DocumentStatus parseStatus(String status) {
    switch (status.toLowerCase()) {
      case 'pending':
        return DocumentStatus.pending;
      case 'rejected':
        return DocumentStatus.rejected;
      case 'success':
        return DocumentStatus.success;
      default:
        throw ArgumentError('Invalid status: $status');
    }
  }

  static String statusToString(DocumentStatus status) {
    switch (status) {
      case DocumentStatus.pending:
        return 'pending';
      case DocumentStatus.rejected:
        return 'rejected';
      case DocumentStatus.success:
        return 'success';
    }
  }

  Color getStatusColor() {
    switch (status) {
      case DocumentStatus.pending:
        return const Color(0xFFFFA500);
      case DocumentStatus.rejected:
        return Colors.red;
      case DocumentStatus.success:
        return Colors.green;
    }
  }
}

List<DocumentModel> documents = [
  DocumentModel(
      id: '090900',
      status: DocumentStatus.pending,
      description: 'First document',
      fileUrl: 'https://example.com/document1.pdf'),
  DocumentModel(
      id: '090900',
      status: DocumentStatus.rejected,
      description: 'Second document',
      fileUrl: 'https://example.com/document2.pdf'),
  DocumentModel(
      id: '090900',
      status: DocumentStatus.success,
      description: 'Third document',
      fileUrl: 'https://example.com/document3.pdf'),
];

List<DocumentModel> allDocuments = [
  DocumentModel(
      id: '090900',
      status: DocumentStatus.pending,
      description: 'First document',
      fileUrl: 'https://example.com/document1.pdf'),
  DocumentModel(
      id: '090900',
      status: DocumentStatus.rejected,
      description: 'Second document',
      fileUrl: 'https://example.com/document2.pdf'),
  DocumentModel(
      id: '090900',
      status: DocumentStatus.success,
      description: 'Third document',
      fileUrl: 'https://example.com/document3.pdf'),
  DocumentModel(
      id: '090900',
      status: DocumentStatus.pending,
      description: 'First document',
      fileUrl: 'https://example.com/document1.pdf'),
  DocumentModel(
      id: '090900',
      status: DocumentStatus.rejected,
      description: 'Second document',
      fileUrl: 'https://example.com/document2.pdf'),
  DocumentModel(
      id: '090900',
      status: DocumentStatus.success,
      description: 'Third document',
      fileUrl: 'https://example.com/document3.pdf'),
  DocumentModel(
      id: '090900',
      status: DocumentStatus.pending,
      description: 'First document',
      fileUrl: 'https://example.com/document1.pdf'),
  DocumentModel(
      id: '090900',
      status: DocumentStatus.rejected,
      description: 'Second document',
      fileUrl: 'https://example.com/document2.pdf'),
  DocumentModel(
      id: '090900',
      status: DocumentStatus.success,
      description: 'Third document',
      fileUrl: 'https://example.com/document3.pdf'),
  DocumentModel(
      id: '090900',
      status: DocumentStatus.pending,
      description: 'First document',
      fileUrl: 'https://example.com/document1.pdf'),
  DocumentModel(
      id: '090900',
      status: DocumentStatus.rejected,
      description: 'Second document',
      fileUrl: 'https://example.com/document2.pdf'),
  DocumentModel(
      id: '090900',
      status: DocumentStatus.success,
      description: 'Third document',
      fileUrl: 'https://example.com/document3.pdf'),
];
