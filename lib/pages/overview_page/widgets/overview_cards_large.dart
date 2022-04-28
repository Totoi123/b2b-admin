import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../clients_page/controller/client_controller.dart';
import 'info_card.dart';

class OverviewCardsLargeScreen extends StatelessWidget {
  OverviewCardsLargeScreen({Key key}) : super(key: key);
  final ClientController clientController = Get.find<ClientController>();

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    print(clientController.clients.length);

    return Row(
      children: [
        InfoCard(
          title: "New Orders",
          value: "100",
          onTap: () {},
          topColor: Colors.orange,
        ),
        SizedBox(width: _width / 64),
        InfoCard(
          title: "Completed Orders",
          value: "25",
          onTap: () {},
          topColor: Colors.lightGreen,
        ),
        SizedBox(width: _width / 64),
        InfoCard(
          title: "Pending Orders",
          value: "75",
          onTap: () {},
          topColor: Colors.redAccent,
        ),
        SizedBox(width: _width / 64),
        // InfoCard(
        //   title: "Orders Delivered",
        //   value: "7",
        //   onTap: () {},
        //   topColor: Colors.orange,
        // ),
        // SizedBox(width: _width / 64),
      ],
    );
  }
}
