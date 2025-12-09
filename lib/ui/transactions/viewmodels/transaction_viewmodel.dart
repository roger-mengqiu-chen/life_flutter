import 'package:life_flutter/data/repositories/transaction_repository.dart';
import 'package:life_flutter/domain/models/transaction.dart';

class TransactionViewmodel {
  TransactionViewmodel({
    required TransactionRepository transactionRepository
  }) : _transactionRepository = transactionRepository;

  final TransactionRepository _transactionRepository;

  Future<List<Transaction>> get transactions async {
    return await _transactionRepository.transactions;
  }
}