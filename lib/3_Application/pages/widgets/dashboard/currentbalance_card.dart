import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CurrentBalanceCard extends StatelessWidget {
  final int balance;
  const CurrentBalanceCard({super.key, required this.balance});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 260,
      width: 180,
      padding: EdgeInsets.all(20.0),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Current Balance',
            style: GoogleFonts.poppins(
              color: Colors.white,
              fontSize: 16,
            ),
          ),
          Text(
            'Rs. $balance',
            style: GoogleFonts.poppins(
              color: Colors.white,
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
