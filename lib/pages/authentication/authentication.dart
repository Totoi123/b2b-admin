import 'package:flutter/material.dart';
import 'package:flutter_web_dashboard/constants/style.dart';
import 'package:flutter_web_dashboard/pages/authentication/auth_token_manager.dart';

import 'package:flutter_web_dashboard/widgets/custom_text.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'login_controller.dart';

class AuthenticationPage extends StatefulWidget {
  AuthenticationPage({Key key}) : super(key: key);

  @override
  State<AuthenticationPage> createState() => _AuthenticationPageState();
}

class _AuthenticationPageState extends State<AuthenticationPage> {
  final LoginController loginController = Get.find<LoginController>();

  @override
  void initState() {
    super.initState();
    () async {
      loginController.dio.interceptors.add(TokenManager.instance);
      await loginController.checkLogin();
    }();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Container(
              constraints: BoxConstraints(maxWidth: 400),
              padding: EdgeInsets.all(24),
              child: Container(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(right: 12),
                        child: Image.asset("assets/icons/logo.png"),
                      ),
                      Expanded(child: Container())
                    ],
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Row(children: [
                    Text(
                      "Login",
                      style: GoogleFonts.roboto(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  ]),
                  Row(children: [
                    CustomText(
                      text: "Welcome back to the admin panel",
                      color: lightGrey,
                    ),
                  ]),
                  SizedBox(
                    height: 15,
                  ),
                  Container(
                      child: Form(
                    key: loginController.loginFormKey,
                    child: Column(
                      children: [
                        TextFormField(
                          controller: loginController.emailController,
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                              labelText: "Email",
                              hintText: "abc@example.com",
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20))),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        TextFormField(
                          controller: loginController.passwordController,
                          obscureText: true,
                          decoration: InputDecoration(
                              labelText: "Password",
                              hintText: "Enter your password",
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20))),
                        ),
                      ],
                    ),
                  )),
                  SizedBox(
                    height: 15,
                  ),
                  InkWell(
                      onTap: () {
                        loginController.login();
                      },
                      child: Container(
                          decoration: BoxDecoration(
                              color: active,
                              borderRadius: BorderRadius.circular(20)),
                          alignment: Alignment.center,
                          width: double.maxFinite,
                          padding: EdgeInsets.symmetric(vertical: 16),
                          child:
                              CustomText(text: "Login", color: Colors.white))),
                  SizedBox(
                    height: 15,
                  )
                ],
              )))),
    );
  }
}
