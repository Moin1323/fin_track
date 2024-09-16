// ignore_for_file: prefer_const_constructors

import 'package:expenseapp/2_Domain/auth_controllers/login_controller.dart';
import 'package:expenseapp/3_Application/pages/auth%20pages/forgotpassword_page.dart';
import 'package:expenseapp/3_Application/pages/auth%20pages/signin_page.dart';
import 'package:expenseapp/3_Application/pages/widgets/authentication/google_login.dart';
import 'package:expenseapp/3_Application/pages/widgets/authentication/my_textfield.dart';
import 'package:expenseapp/3_Application/pages/widgets/authentication/register_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  //sign user in
  void signUserIn() {}

  @override
  Widget build(BuildContext context) {
    LoginController controller = Get.put(LoginController());
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
              children: [
                const SizedBox(height: 80),

                //Heding
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40.0),
                  child: Row(
                    children: [
                      Text(
                        "Login.",
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

                //user textfield
                MyTextfield(
                  controller: controller.userNameContoller,
                  hintText: "Username",
                ),

                const SizedBox(height: 20),

                //password textfield
                MyTextfield(
                  controller: controller.passwordContrller,
                  hintText: "Password",
                ),

                const SizedBox(height: 20),

                //sign in button
                SignInButton(
                  onTap: () async {
                    //  print("===========================");
                    await controller.submit(context);
                  },
                  operation: "Login",
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
                          style: TextStyle(
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
                const SizedBox(height: 50),
                //forgot password
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ForgotPasswordPage(),
                            ),
                          );
                        },
                        child: Text(
                          'Forgot your Password?',
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.inversePrimary,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 15),

                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 35.0),
                  child: Divider(
                    thickness: 0.7,
                    color: Theme.of(context).colorScheme.inversePrimary,
                  ),
                ),

                const SizedBox(height: 5),

                //not a member? register now
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 40.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Don't have an account?",
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.inversePrimary,
                        ),
                      ),

                      SizedBox(width: 25),

                      //register now button
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SignInPage(),
                            ),
                          );
                        },
                        child: Container(
                          height: 45,
                          width: 90,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            boxShadow: [
                              BoxShadow(
                                color: Theme.of(context).colorScheme.secondary,
                                spreadRadius: 1,
                                blurRadius: 3,
                                offset: Offset(0, 2),
                              ),
                            ],
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
                            child: Padding(
                              padding: const EdgeInsets.all(12),
                              child: Text(
                                'Register',
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
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
