import 'package:expenseapp/2_Domain/models/transacitions_provider.dart';
import 'package:expenseapp/3_Application/pages/widgets/dashboard/transaction_list.dart';
import 'package:flutter/material.dart';

class TransactionsPage extends StatelessWidget {
  const TransactionsPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          height: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomLeft,
              colors: [
                Color(0xFF1A1D3A),
                Color(0xFF302C6B),
                Color(0xFF5B2586),
              ],
              transform: GradientRotation(32),
            ),
          ),
          child: SingleChildScrollView(
              child: TransactionList(transactions: transactions))),
    );
  }
}
