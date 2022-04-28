import 'package:flutter/material.dart';
import 'package:flutter_web_dashboard/constants/style.dart';
import 'package:flutter_web_dashboard/pages/clients_page/controller/add_client_controller.dart';
import 'package:flutter_web_dashboard/widgets/make_input.dart';
import 'package:get/get.dart';

import '../../helpers/responsiveness.dart';
import '../../widgets/custom_text.dart';

class AddClientsPage extends StatelessWidget {
  AddClientsPage({Key key}) : super(key: key);

  final AddClientController addClientController =
      Get.put(AddClientController());

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(children: [
            Container(
              margin: EdgeInsets.only(
                  top: ResponsiveWidget.isSmallScreen(context) ? 56 : 6),
              child: CustomText(
                text: 'Add Clients',
                size: 24,
                weight: FontWeight.bold,
              ),
            )
          ]),
          SizedBox(
            height: 30,
          ),
          Expanded(
              child: Container(
            constraints: BoxConstraints(maxWidth: 800),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(
                  text: 'Add New Clients',
                  size: 30,
                  weight: FontWeight.bold,
                ),
                SizedBox(height: 40),
                Row(children: [
                  Expanded(
                    flex: 1,
                    child: MakeINput(
                      text: 'First Name',
                      controller: addClientController.firstName,
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    flex: 1,
                    child: MakeINput(
                      text: 'Last Name',
                      controller: addClientController.lastName,
                    ),
                  ),
                ]),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Expanded(
                      child: MakeINput(
                        text: 'Company Name',
                        controller: addClientController.companyName,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Expanded(
                        child: MakeINput(
                      text: 'Email',
                      controller: addClientController.email,
                    )),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                        child: MakeINput(
                      text: 'Phone Number',
                      controller: addClientController.phone,
                    )),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Expanded(
                        child: MakeINput(
                            text: 'Password',
                            obscureText: true,
                            controller: addClientController.password)),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: MakeINput(
                        text: 'Confirm Password',
                        obscureText: true,
                        controller: addClientController.confirmPassword,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        addClientController.addClient();
                      },
                      child: CustomText(
                        text: 'Save',
                        size: 20,
                        color: Colors.white,
                      ),
                      style: ElevatedButton.styleFrom(
                        primary: active,
                        fixedSize: Size(240, 50),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        addClientController.cancel();
                      },
                      child: CustomText(
                          text: 'Cancel',
                          size: 20,
                          color: active.withOpacity(.7)),
                      style: ElevatedButton.styleFrom(
                        primary: light,
                        fixedSize: Size(240, 50),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                            side: BorderSide(color: active, width: .5)),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ))
        ],
      ),
    );
  }
}
