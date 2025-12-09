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
        'm.id AS merchantId, '
        'm.name AS merchantName, '
        'l.id AS locationId, '
        'l.name AS locationName, '
        't.transactionType, '
        'c.id AS categoryId, '
        'c.name AS categoryName '
        'FROM life_transaction t '
      'LEFT JOIN merchant m ON t.merchantId = m.id '
      'LEFT JOIN location l ON m.locationId = l.id '
      'LEFT JOIN category c ON t.categoryId = c.id '
      'ORDER BY transactionTime DESC'
    );
    print('transactions: $res');

    return res.map((e) => Transaction.fromJson({
        'id': e['id'],
        'transactionTime': e['transactionTime'],
        'amount': e['amount'],
        'merchant': {
          'id': e['merchantId'],
          'name': e['merchantName'],
        },
        'location': {
          'id': e['locationId'],
          'name': e['locationName'],
        },
        'transactionType': e['transactionType'],
        'category': {
          'id': e['categoryId'],
          'name': e['categoryName'],
        }
      }
    )).toList();
  }
}
