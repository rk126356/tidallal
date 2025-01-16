class ReceiptModel {
  final String id;
  final String description;
  final String contract;
  final double amount;

  ReceiptModel({
    required this.id,
    required this.description,
    required this.contract,
    required this.amount,
  });

  // Factory constructor to create a ReceiptModel from a Map
  factory ReceiptModel.fromJson(Map<String, dynamic> json) {
    return ReceiptModel(
      id: json['id'] as String,
      description: json['description'] as String,
      contract: json['contract'] as String,
      amount: (json['amount'] as num).toDouble(),
    );
  }

  // Method to convert ReceiptModel to a Map
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'description': description,
      'contract': contract,
      'amount': amount,
    };
  }
}

// Sample list of receipts
List<ReceiptModel> receipts = [
  ReceiptModel(
    id: 'RCP-001',
    description: 'Payment for Invoice INV-001',
    contract: '#090900',
    amount: 5000.00,
  ),
  ReceiptModel(
    id: 'RCP-002',
    description: 'Partial payment for Invoice INV-002',
    contract: '#090901',
    amount: 2500.00,
  ),
  ReceiptModel(
    id: 'RCP-003',
    description: 'Full payment for Invoice INV-003',
    contract: '#090902',
    amount: 7500.00,
  ),
  ReceiptModel(
    id: 'RCP-004',
    description: 'Advance payment for Contract #090903',
    contract: '#090903',
    amount: 1000.00,
  ),
  ReceiptModel(
    id: 'RCP-005',
    description: 'Final payment for Invoice INV-004',
    contract: '#090904',
    amount: 3500.00,
  ),
];
