import 'package:expenseapp/2_Domain/models/transacitions_provider.dart';
import 'package:expenseapp/3_Application/pages/widgets/dashboard/currentbalance_card.dart';
import 'package:expenseapp/3_Application/pages/widgets/dashboard/features_button.dart';
import 'package:expenseapp/3_Application/pages/widgets/dashboard/transaction_list.dart';
import 'package:flutter/material.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity + double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xFF1A1D3A),
              Color(0xFF302C6B),
              Color(0xFF5B2586),
            ],
            transform: GradientRotation(32),
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 40),
              Padding(
                padding: const EdgeInsets.only(left: 12.0, right: 12, top: 12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    CurrentBalanceCard(
                      balance: 500000,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        FeaturesButton(
                          text: "Add Earnings",
                          color: Colors.blue,
                          icon: Icons.monetization_on,
                        ),
                        const SizedBox(height: 16),
                        FeaturesButton(
                          text: "Add Expenses",
                          color: Colors.orange,
                          icon: Icons.money_off,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 25),
              TransactionList(
                transactions: transactions,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
