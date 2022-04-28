import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_web_dashboard/constants/controllers.dart';
import 'package:flutter_web_dashboard/pages/authentication/login_controller.dart';
import 'package:flutter_web_dashboard/routing/routes.dart';

import 'package:get/get.dart';

class AddClientController extends GetxController {
  TextEditingController firstName = TextEditingController();
  TextEditingController lastName = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController companyName = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();

  LoginController loginController = Get.find<LoginController>();

  Dio dio = new Dio();

  Future addClient() async {
    const String pathUrl = "http://172.17.0.1:3000/client/register";

    dynamic data = {
      "firstName": firstName.text,
      "lastName": lastName.text,
      "email": email.text,
      "phone": phone.text,
      "companyName": companyName.text,
      "password": password.text,
      "createdBy": loginController.id.toString(),
    };

    if (password.text != confirmPassword.text) {
      return Get.snackbar(
          "Password", "Password and confirm Password do not match");
    }

    var response = await dio.post(pathUrl, data: data);

    if (response.statusCode == 200) {
      final body = response.data;
      Get.snackbar("Added Successfully", body['message']);
    }

    print(response);
  }

  cancel() async {
    navigationController.navigateTo(ClientsPageRoute);
  }
}
