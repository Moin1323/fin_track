import 'package:expenseapp/3_Application/pages/auth%20pages/login_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 2), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => LoginPage()),
      );
    });
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xFF1A1D3A),
              Color(0xFF302C6B),
              Color(0xFF5B2586),
            ],
          ),
        ),
        child: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "FinTrack.",
              style: GoogleFonts.poppins(
                color: Theme.of(context).colorScheme.primary, // Pink color
                fontWeight: FontWeight.bold,
                fontSize: 50, // Adjust size as needed
              ),
            ),
            Text(
              "The Most Trusted & Secure Expense Manager.",
              style: GoogleFonts.poppins(
                color:
                    Theme.of(context).colorScheme.inversePrimary, // Pink color
                fontSize: 12, // Adjust size as needed
              ),
            ),
          ],
        )),
      ),
      // floatingActionButton: Padding(
      //   padding: const EdgeInsets.only(bottom: 8, right: 8),
      //   child: FloatingActionButton(
      //     child: Icon(Icons.login),
      //     onPressed: () {
      //       Navigator.push(
      //           context, MaterialPageRoute(builder: (context) => LoginPage()));
      //     },
      //   ),
      // ),
    );
  }
}
