import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../../routing/routes.dart';

class LoginController extends GetxController {
  String name = '';
  String id = '';
  final storage = const FlutterSecureStorage();
  var isLoading = false.obs;
  final loginFormKey = GlobalKey<FormState>();
  TextEditingController emailController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();

  Dio dio = Dio();

  Future login() async {
    const String pathUrl = "http://172.17.0.1:3000/admin/login";

    dynamic data = {
      "adminEmail": emailController.text,
      "adminPassword": passwordController.text,
    };

    var response = await dio.post(pathUrl, data: data);

    if (response.statusCode == 200) {
      final body = response.data;
      name = body['adminData']['admin_name'];
      id = body['adminData']['admin_id'];
      Get.offAllNamed(RootRoute);
    }
  }

  Future<void> checkLogin() async {
    try {
      var response = await dio.get('http://172.17.0.1:3000/dashboard/');
      if (response.statusCode == 200) {
        final body = response.data;
        name = body['admin_name'];
        id = body['admin_id'];
        Get.offAllNamed(RootRoute);
      }
    } on DioError catch (e) {
      debugPrint("Status code : ${e.response.statusCode}");
    }
  }
}
