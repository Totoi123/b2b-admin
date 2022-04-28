import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_web_dashboard/constants/controllers.dart';

import 'package:flutter_web_dashboard/constants/style.dart';
import 'package:flutter_web_dashboard/pages/clients_page/controller/client_controller.dart';
import 'package:flutter_web_dashboard/routing/routes.dart';
import 'package:flutter_web_dashboard/widgets/custom_text.dart';
import 'package:get/get.dart';

class ProductDataTable extends StatelessWidget {
  final ClientController clientController = Get.find<ClientController>();

  @override
  Widget build(BuildContext context) {
    print(clientController.clients[0]['first_name']);
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
      padding: const EdgeInsets.all(16),
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
                text: "Products",
                color: lightGrey,
                weight: FontWeight.bold,
                size: 24,
              ),
              Expanded(child: Container()),
              MaterialButton(
                color: active,
                onPressed: () {
                  navigationController.navigateTo(AddProductsPageRoute);
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(children: [
                    Icon(Icons.add, size: 18, color: light),
                    SizedBox(width: 8),
                    CustomText(
                      text: 'Add Product',
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
                  label: Text("Product Id"),
                  size: ColumnSize.L,
                ),
                DataColumn(
                  label: Text('Name'),
                ),
                DataColumn(
                  label: Text('Category'),
                ),
                DataColumn(
                  label: Text('Price'),
                ),
                DataColumn(label: Text('Count In Stock')),
                DataColumn(label: Text('Actions')),
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
