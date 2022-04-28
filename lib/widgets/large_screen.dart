import 'package:flutter/material.dart';
import 'package:flutter_web_dashboard/helpers/local_navigator.dart';
// import 'package:flutter_web_dashboard/pages/clients_page/controller/client_controller.dart';
import 'package:flutter_web_dashboard/widgets/side_menu.dart';
// import 'package:get/get.dart';

class LargeScreen extends StatelessWidget {
  LargeScreen({Key key}) : super(key: key);

  // final ClientController clientController = Get.put(ClientController());

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(child: SideMenu()),
        Expanded(
            flex: 5,
            child: Container(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: localNavigator()))
      ],
    );
  }
}
