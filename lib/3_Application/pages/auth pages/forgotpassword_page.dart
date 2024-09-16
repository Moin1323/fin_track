import 'package:expenseapp/3_Application/pages/auth%20pages/login_page.dart';
import 'package:expenseapp/3_Application/pages/widgets/authentication/my_textfield.dart';
import 'package:expenseapp/3_Application/pages/widgets/authentication/register_button.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ForgotPasswordPage extends StatelessWidget {
  ForgotPasswordPage({super.key});

  final userNameContoller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
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
          height: MediaQuery.of(context).size.height,
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  children: [
                    const SizedBox(height: 80),
                    //Heding
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 40.0),
                      child: Text(
                        "Forgot Password.",
                        style: GoogleFonts.poppins(
                          color: Theme.of(context).colorScheme.primary,
                          fontWeight: FontWeight.bold,
                          fontSize: 30, // Adjust size as needed
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),

                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 40),
                      child: Text(
                        'Enter your email address below: ',
                        style: GoogleFonts.poppins(
                          color: Colors.white,
                          fontSize: 12, // Adjust size as needed
                        ),
                      ),
                    ),

                    const SizedBox(height: 30),

                    //Email textfield
                    MyTextfield(
                      controller: userNameContoller,
                      hintText: "Email",
                    ),

                    const SizedBox(height: 20),

                    //sent email button
                    SignInButton(
                      onTap: () {},
                      operation: "Send Email",
                    ),
                    const SizedBox(height: 80),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Already have an account?",
                      style: GoogleFonts.poppins(
                          color: Theme.of(context).colorScheme.inversePrimary),
                    ),
                    const SizedBox(width: 5),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => LoginPage(),
                          ),
                        );
                      },
                      child: RichText(
                        text: TextSpan(
                          text: "login",
                          style: GoogleFonts.poppins(
                            color: Theme.of(context).colorScheme.primary,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
