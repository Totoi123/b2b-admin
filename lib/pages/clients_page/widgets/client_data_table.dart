import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_web_dashboard/constants/controllers.dart';

import 'package:flutter_web_dashboard/constants/style.dart';
import 'package:flutter_web_dashboard/pages/clients_page/controller/client_controller.dart';
import 'package:flutter_web_dashboard/routing/routes.dart';
import 'package:flutter_web_dashboard/widgets/custom_text.dart';
import 'package:get/get.dart';

class ClientsDataTable extends StatelessWidget {
  final ClientController clientController = Get.find<ClientController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: active.withOpacity(.4), width: .5),
        boxShadow: [
          BoxShadow(
              offset: Offset(0, 6),
              color: lightGrey.withOpacity(.1),
              blurRadius: 12)
        ],
        borderRadius: BorderRadius.circular(8),
      ),
      padding: const EdgeInsets.all(20),
      margin: EdgeInsets.only(bottom: 30),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              SizedBox(
                width: 10,
              ),
              CustomText(
                text: "Clients",
                color: lightGrey,
                weight: FontWeight.bold,
                size: 24,
              ),
              Expanded(child: Container()),
              MaterialButton(
                color: active,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                onPressed: () {
                  navigationController.navigateTo(AddClientsPageRoute);
                },
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(children: [
                    Icon(Icons.add, size: 18, color: light),
                    SizedBox(width: 8),
                    CustomText(
                      text: 'Add',
                      color: light,
                    )
                  ]),
                ),
              )
            ],
          ),
          SizedBox(height: 20),
          DataTable2(
              columnSpacing: 12,
              horizontalMargin: 12,
              minWidth: 600,
              columns: [
                DataColumn2(
                  label: Text("Name",
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  size: ColumnSize.M,
                ),
                DataColumn2(
                  label: Text(
                    'Email',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  size: ColumnSize.L,
                ),
                DataColumn2(
                  label: Text(
                    'Phone Number',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  size: ColumnSize.M,
                ),
                DataColumn2(
                  label: Text(
                    'Company',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  size: ColumnSize.M,
                ),
                DataColumn2(
                    label: Text(
                      'Action',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    size: ColumnSize.L)
              ],
              rows: List.generate(
                  clientController.clients.length,
                  (index) => DataRow(cells: [
                        DataCell(CustomText(
                          text: clientController.clients[index]['first_name'] +
                              " " +
                              clientController.clients[index]['last_name'],
                        )),
                        DataCell(CustomText(
                            text: clientController.clients[index]['email'])),
                        DataCell(CustomText(
                            text: clientController.clients[index]['phone'])),
                        DataCell(CustomText(
                            text: clientController.clients[index]
                                ['company_name'])),
                        DataCell(Row(
                          children: [
                            Container(
                                decoration: BoxDecoration(
                                  color: light,
                                  borderRadius: BorderRadius.circular(20),
                                  border: Border.all(color: active, width: .5),
                                ),
                                padding: EdgeInsets.symmetric(
                                    horizontal: 12, vertical: 6),
                                child: CustomText(
                                  text: "Edit",
                                  color: active.withOpacity(.7),
                                  weight: FontWeight.bold,
                                )),
                            SizedBox(width: 5),
                            InkWell(
                              onTap: () {
                                print('Deleted');
                              },
                              child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.red[700],
                                    borderRadius: BorderRadius.circular(20),
                                    border:
                                        Border.all(color: active, width: .5),
                                  ),
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 12, vertical: 6),
                                  child: CustomText(
                                    text: "Delete",
                                    color: Colors.white,
                                    weight: FontWeight.bold,
                                  )),
                            ),
                          ],
                        )),
                      ]))),
        ],
      ),
    );
  }
}
