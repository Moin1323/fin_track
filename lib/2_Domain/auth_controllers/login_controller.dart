import 'package:expenseapp/2_Domain/models/login_user.dart';
import 'package:expenseapp/3_Application/pages/common_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart';

class LoginController extends GetxController {
  //text editor controlers for both password and username
  final userNameContoller = TextEditingController();
  final passwordContrller = TextEditingController();

  String _message = "";
//method to submit the credentials to model

  Future<void> submit(BuildContext context) async {
    LoginUser user = LoginUser(
        username: userNameContoller.text.trim(),
        password: passwordContrller.text.trim());

    bool validateResult = validateUser(user);

    if (validateResult) {
      bool serverResponse = await authenticateUser(user);
      if (serverResponse) {
        await showMessage(
            context: Get.context!,
            title: "Success",
            message: "User Login Successfully!");
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => CommonPage()),
        );
      } else {
        await showMessage(
            context: Get.context!,
            title: "Error",
            message: "Incorrect Username of Password");
      }
    } else {
      await showMessage(
          context: Get.context!, title: "Error", message: _message);
    }
  }

//validating username and password
  bool validateUser(LoginUser user) {
    if (user.username == null && user.password == null) {
      _message = "username or Password cannot be empty";
      return false;
    }
    if (user.username.toString().isEmpty) {
      _message = "username cannot be empty";
      return false;
    }
    if (user.password.toString().isEmpty) {
      _message = "password cannot be empty";
      return false;
    }
    return true;
  }

  Future<bool> authenticateUser(LoginUser user) async {
    Dio dio = Dio(BaseOptions(connectTimeout: Duration(seconds: 5)));
    String apiUrl = "https://dummyjson.com/auth/login";

    try {
      Map<String, dynamic> requestData = {
        'username': user.username,
        'password': user.password,
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

  //Display Dailog Box Code
  showMessage(
      {required BuildContext context,
      required String title,
      required String message}) {
    showCupertinoDialog(
        context: context,
        builder: (context) {
          return CupertinoAlertDialog(
            title: Text(title),
            content: Text(message),
            actions: [
              CupertinoDialogAction(
                child: Text("Ok"),
                onPressed: () {
                  Get.back();
                },
              )
            ],
          );
        });
  }
}
