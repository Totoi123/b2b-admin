import 'package:flutter/material.dart';
import 'package:flutter_web_dashboard/helpers/responsiveness.dart';
import 'package:flutter_web_dashboard/widgets/custom_text.dart';
import 'package:flutter_web_dashboard/widgets/make_input.dart';

import '../../constants/style.dart';

class AddProductPage extends StatelessWidget {
  const AddProductPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                margin: EdgeInsets.only(
                    top: ResponsiveWidget.isSmallScreen(context) ? 56 : 6),
                child: CustomText(
                  text: 'Add Product',
                  size: 24,
                  weight: FontWeight.bold,
                ),
              )
            ],
          ),
          SizedBox(height: 30),
          Expanded(
              child: Container(
            constraints: BoxConstraints(maxWidth: 600),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(
                  text: 'Add New Product',
                  size: 30,
                  weight: FontWeight.bold,
                ),
                SizedBox(
                  height: 40,
                ),
                MakeINput(
                  text: 'Product Name',
                ),
                SizedBox(
                  height: 20,
                ),
                MakeINput(
                  text: 'Category',
                ),
                SizedBox(
                  height: 20,
                ),
                MakeINput(
                  text: 'Price',
                ),
                SizedBox(
                  height: 20,
                ),
                MakeINput(
                  text: 'Count In Stock',
                ),
                SizedBox(
                  height: 20,
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    ElevatedButton(
                      onPressed: () {},
                      child: CustomText(
                        text: 'Add',
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
                      onPressed: () {},
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
