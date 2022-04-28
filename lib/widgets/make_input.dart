import 'package:flutter/material.dart';
import 'package:flutter_web_dashboard/constants/style.dart';
import 'package:flutter_web_dashboard/widgets/custom_text.dart';

class MakeINput extends StatelessWidget {
  final String text;
  final controller;
  final bool obscureText;
  const MakeINput(
      {Key key, this.text, this.obscureText = false, this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomText(
            text: text,
            size: 14,
            color: active,
            weight: FontWeight.bold,
          ),
          SizedBox(
            height: 20,
          ),
          TextField(
            obscureText: obscureText,
            cursorColor: active,
            controller: controller,
            decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: active))),
          )
        ],
      ),
    );
  }
}
