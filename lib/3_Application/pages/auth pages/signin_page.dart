import 'package:expenseapp/2_Domain/auth_controllers/signup_controller.dart';
import 'package:expenseapp/3_Application/pages/auth%20pages/login_page.dart';
import 'package:expenseapp/3_Application/pages/widgets/authentication/google_login.dart';
import 'package:expenseapp/3_Application/pages/widgets/authentication/my_textfield.dart';
import 'package:expenseapp/3_Application/pages/widgets/authentication/register_button.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SignInPage extends StatelessWidget {
  SignInPage({super.key});

  //text editor controlers for both password and username
  final userNameContoller = TextEditingController();
  final userEmailController = TextEditingController();
  final passwordContrller = TextEditingController();
  final confirmPasswordContrller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    SignupController controller = SignupController();
    return Scaffold(
      resizeToAvoidBottomInset: true,
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
              children: [
                const SizedBox(height: 80),
                //Heding
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40.0),
                  child: Row(
                    children: [
                      Text(
                        "Create Account.",
                        style: GoogleFonts.poppins(
                          color: Theme.of(context).colorScheme.primary,
                          fontWeight: FontWeight.bold,
                          fontSize: 30, // Adjust size as needed
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 15),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40),
                  child: Row(
                    children: [
                      Text(
                        'if you are already a member, easliy log in     ',
                        style: GoogleFonts.poppins(
                          color: Colors.white,
                          fontSize: 12, // Adjust size as needed
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 40),

                //user name
                MyTextfield(
                  controller: controller.userNameController,
                  hintText: "Username",
                ),

                const SizedBox(height: 20),

                //user email
                MyTextfield(
                  controller: controller.emailController,
                  hintText: "Email",
                ),

                const SizedBox(height: 20),

                //password textfield
                MyTextfield(
                  controller: controller.passwordController,
                  hintText: "Password",
                ),

                const SizedBox(height: 20),

                //password textfield
                MyTextfield(
                  controller: confirmPasswordContrller,
                  hintText: "Confirm Password",
                ),

                const SizedBox(height: 10),

                const SizedBox(height: 20),

                //sign in button
                SignInButton(
                  onTap: () {
                    controller.submit(context);
                  },
                  operation: "Sign Up",
                ),

                const SizedBox(height: 30),

                //or continue with
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: Divider(
                          thickness: 0.5,
                          color: Theme.of(context).colorScheme.inversePrimary,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 40.0),
                        child: Text(
                          'OR',
                          style: GoogleFonts.poppins(
                            color: Theme.of(context).colorScheme.inversePrimary,
                            fontSize: 18,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Divider(
                          thickness: 0.5,
                          color: Theme.of(context).colorScheme.inversePrimary,
                        ),
                      )
                    ],
                  ),
                ),

                const SizedBox(height: 30),

                const GoogleLogin(),

                const SizedBox(height: 30),

                //not a member? register now
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 40.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Already have an account?",
                        style: GoogleFonts.poppins(
                            color:
                                Theme.of(context).colorScheme.inversePrimary),
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
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
