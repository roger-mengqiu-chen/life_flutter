import 'package:flutter/material.dart';
import 'package:life_flutter/domain/models/transaction.dart';
import 'package:life_flutter/utils/extensions.dart';

class TransactionBrief extends StatelessWidget {
  const TransactionBrief({
    super.key,
    required this.transaction
  });

  final Transaction transaction;

  @override
  Widget build(BuildContext context) {

    Color amountColor = Colors.red;
    if (transaction.transactionType == TransactionType.income) {
      amountColor = Colors.green;
    } else if (transaction.transactionType == TransactionType.transfer) {
      amountColor = Colors.grey;
    }

    return Card(
      elevation: 1,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Row (
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Expanded(
              flex: 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    transaction.merchant.toString(),
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 5),
                  Row(
                    children: [
                      Text(
                        transaction.transactionTime.toString().substring(0, 10),
                        style: TextStyle(
                          color: Colors.grey[600],
                          fontSize: 12,
                        )
                      ),
                      Text(
                        ' | ',
                        style: TextStyle(
                          color: Colors.grey[400],
                          fontSize: 12,
                        )
                      ),
                      Text(
                        transaction.category.toString().toCapitalized(),
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 12,
                        )
                      )
                    ]
                  )
                ]
              )
            ),
            Expanded(
              flex: 1,
              child: Align(
                alignment: Alignment.centerRight,
                child: Text(
                  transaction.amount.toString(),
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: amountColor
                  )
                )
              )
            )
          ]
        )
      )
    );
  }
}

class Transactions extends StatelessWidget {
  const Transactions({
    super.key,
    required this.transactions
  });

  final List<Transaction> transactions;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: transactions.length,
      itemBuilder: (context, index) {
        return TransactionBrief(transaction: transactions[index]);
      }
    );
  }
}