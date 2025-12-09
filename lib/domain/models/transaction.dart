import 'package:life_flutter/domain/models/category.dart';
import 'package:life_flutter/domain/models/merchant.dart';

enum TransactionType {
  income, expense, transfer
}

class Transaction {
  Transaction({
    this.id,
    required this.transactionTime,
    required this.amount,
    required this.merchant,
    required this.transactionType,
    required this.category
  });

  int? id;
  DateTime transactionTime;
  double amount = 0.0;
  Merchant merchant;
  TransactionType transactionType = TransactionType.expense;
  Category category;

  factory Transaction.fromJson(Map<String, dynamic> json) {
    return Transaction(
      id: json['id'] as int?,
      transactionTime: DateTime.parse(json['transactionTime'] as String),
      amount: json['amount'] as double,
      merchant: Merchant.fromJson(json['merchant'] as Map<String, dynamic>),
      transactionType: TransactionType.values.firstWhere((element) => element.name == json['transactionType']),
      category: Category.fromJson(json['category'] as Map<String, dynamic>)
    );
  }
}