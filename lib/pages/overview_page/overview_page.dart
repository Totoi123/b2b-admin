import 'package:flutter/material.dart';
import 'package:flutter_web_dashboard/helpers/responsiveness.dart';
import 'package:flutter_web_dashboard/widgets/custom_text.dart';
import 'package:get/get.dart';

import '../../constants/controllers.dart';
import '../../constants/style.dart';
import '../../routing/routes.dart';
import '../clients_page/controller/client_controller.dart';
import 'widgets/overview_cards.small.dart';
import 'widgets/overview_cards_large.dart';
import 'widgets/overview_cards_medium.dart';

class OverviewPage extends StatelessWidget {
  OverviewPage({Key key}) : super(key: key);
  final ClientController clientController = Get.put(ClientController());

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Obx(() => Row(children: [
              Container(
                margin: EdgeInsets.only(
                    top: ResponsiveWidget.isSmallScreen(context) ? 56 : 6),
                child: CustomText(
                  text: menuController.activeItem.value,
                  size: 24,
                  weight: FontWeight.bold,
                ),
              )
            ])),
        Expanded(
            child: ListView(
          children: [
            CustomText(text: "Today's update", size: 30),
            SizedBox(height: 40),
            if (ResponsiveWidget.isLargeScreen(context) ||
                ResponsiveWidget.isMediumScreen(context))
              if (ResponsiveWidget.isCustomSize(context))
                OverviewCardsMediumScreen()
              else
                OverviewCardsLargeScreen()
            else
              OverviewCardsSmallScreen(),
            SizedBox(
              height: 40,
            ),
            Divider(thickness: 2),
            SizedBox(
              height: 40,
            ),
            Row(
              children: [
                Container(
                  width: 200,
                  height: 130,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                          offset: Offset(0, 6),
                          color: lightGrey.withOpacity(.1),
                          blurRadius: 12)
                    ],
                  ),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                              color: light,
                              borderRadius: BorderRadius.circular(100)),
                          child: Icon(
                            Icons.add,
                            color: active,
                            size: 30,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        CustomText(
                          text: 'Add Items',
                          weight: FontWeight.bold,
                        )
                      ]),
                ),
                SizedBox(width: 25),
                InkWell(
                  onTap: () {
                    menuController.changeActiveitemTo(ClientsPageDisplayName);

                    navigationController.navigateTo(AddClientsPageRoute);
                  },
                  child: Container(
                    width: 200,
                    height: 130,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                            offset: Offset(0, 6),
                            color: lightGrey.withOpacity(.1),
                            blurRadius: 12)
                      ],
                    ),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: 50,
                            height: 50,
                            decoration: BoxDecoration(
                                color: light,
                                borderRadius: BorderRadius.circular(100)),
                            child: Icon(
                              Icons.person_outline_outlined,
                              color: active,
                              size: 30,
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          CustomText(
                            text: 'Add Customers',
                            weight: FontWeight.bold,
                          )
                        ]),
                  ),
                ),
                SizedBox(width: 25),
                Container(
                  width: 200,
                  height: 130,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                          offset: Offset(0, 6),
                          color: lightGrey.withOpacity(.1),
                          blurRadius: 12)
                    ],
                  ),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                              color: light,
                              borderRadius: BorderRadius.circular(100)),
                          child: Icon(
                            Icons.add,
                            color: active,
                            size: 30,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        CustomText(
                          text: 'View Products',
                          weight: FontWeight.bold,
                        )
                      ]),
                ),
                SizedBox(width: 25),
                Container(
                  width: 200,
                  height: 130,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                          offset: Offset(0, 6),
                          color: lightGrey.withOpacity(.1),
                          blurRadius: 12)
                    ],
                  ),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                              color: light,
                              borderRadius: BorderRadius.circular(100)),
                          child: Icon(
                            Icons.add,
                            color: active,
                            size: 30,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        CustomText(
                          text: 'View Reports',
                          weight: FontWeight.bold,
                        )
                      ]),
                ),
              ],
            ),
          ],
        )),
      ],
    );
  }
}
