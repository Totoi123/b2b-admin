import 'package:dio/dio.dart';
import 'package:flutter_web_dashboard/pages/authentication/login_controller.dart';

import 'package:get/get.dart';

class ClientController extends GetxController {
  LoginController loginController = Get.find<LoginController>();

  List clients = [];
  var isLoading = false;

  Dio dio = new Dio();

  @override
  void onInit() {
    getClient();

    super.onInit();
  }

  getClient() async {
    try {
      isLoading = true;
      const baseUrl = "http://172.17.0.1:3000/client/";
      var response = await dio.post(baseUrl, data: {'id': loginController.id});

      clients = response.data;
      print(clients);
      isLoading = false;

      return clients;
    } on DioError catch (e) {
      print(e);
      throw Exception("Failed to load clients");
    }
  }
}
