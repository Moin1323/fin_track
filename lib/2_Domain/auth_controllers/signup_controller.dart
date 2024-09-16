import 'package:dio/dio.dart';
import 'package:expenseapp/2_Domain/models/signup_user.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class SignupController extends GetxController {
  // Controllers
  final userNameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  String _message = "";

  // Method to submit the user data
  Future<void> submit(BuildContext context) async {
    SignUpUser user = SignUpUser(
      userName: userNameController.text.trim(),
      userEmail: emailController.text.trim(),
      userPassword: passwordController.text.trim(),
    );

    bool validateResult = validateUser(user);

    if (validateResult) {
      bool serverResponse = await authenticateUser(user);
      if (serverResponse) {
        await showMessage(
          context: context,
          title: "Success",
          message: "User Signed Up Successfully!",
        );
        // You can navigate to another page if needed
        // Navigator.push(context, MaterialPageRoute(builder: (context) => AnotherPage()));
      } else {
        await showMessage(
          context: context,
          title: "Error",
          message: "Sign Up Failed. Please try again.",
        );
      }
    } else {
      await showMessage(
        context: context,
        title: "Error",
        message: _message,
      );
    }
  }

  // Validation method for user input
  bool validateUser(SignUpUser user) {
    if (user.userName.isEmpty && user.userEmail.isEmpty) {
      _message = "Username and email can't be empty";
      return false;
    }
    if (user.userName.isEmpty) {
      _message = "Username can't be empty";
      return false;
    }
    if (user.userEmail.isEmpty) {
      _message = "Email can't be empty";
      return false;
    }
    if (user.userPassword.isEmpty) {
      _message = "Password can't be empty";
      return false;
    }
    return true;
  }

  // Method to authenticate user with server
  Future<bool> authenticateUser(SignUpUser user) async {
    Dio dio = Dio(BaseOptions(connectTimeout: Duration(seconds: 5)));
    String apiUrl =
        "https://dummyjson.com/auth/signup"; // Your API endpoint here

    try {
      Map<String, dynamic> requestData = {
        'username': user.userName,
        'email': user.userEmail,
        'password': user.userPassword,
      };

      final response = await dio.post(apiUrl, data: requestData);

      if (response.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      return false;
    }
  }

  // Method to display a message to the user
  Future<void> showMessage({
    required BuildContext context,
    required String title,
    required String message,
  }) async {
    await showCupertinoDialog(
      context: context,
      builder: (context) {
        return CupertinoAlertDialog(
          title: Text(title),
          content: Text(message),
          actions: [
            CupertinoDialogAction(
              child: Text("Ok"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
