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
}