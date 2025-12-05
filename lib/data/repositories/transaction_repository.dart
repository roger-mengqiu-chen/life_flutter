import 'package:life_flutter/data/services/db.dart';
import 'package:life_flutter/domain/models/transaction.dart';

class TransactionRepository {
  TransactionRepository({required DB db}) : _db = db;

  final DB _db;

  Future<List<Transaction>> get transactions async {
    List<Map<String, dynamic>> res = await _db.query(
      'SELECT '
        't.id, '
        't.transactionTime, '
        't.amount, '
        'm.name AS merchant, '
        't.transactionType, '
        'c.name AS category '
        'FROM life_transaction t '
      'INNER JOIN merchant m ON t.merchantId = m.id '
      'INNER JOIN category c ON t.categoryId = c.id '
      'ORDER BY transactionTime DESC'
    );
    return res.map((e) => Transaction(
      id: e['id'],
      transactionTime: e['transactionTime'],
      amount: e['amount'],
      merchant: e['merchant'],
      transactionType: e['transactionType'],
      category: e['category']
    )).toList();
  }
}
