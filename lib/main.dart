import 'package:flutter/material.dart';
import 'package:flutter_web_dashboard/layout.dart';
import 'package:flutter_web_dashboard/pages/authentication/auth_token_manager.dart';
import 'package:flutter_web_dashboard/routing/routes.dart';
import 'package:url_strategy/url_strategy.dart';
import 'constants/style.dart';
import 'controllers/menu_controller.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'controllers/navigation_controller.dart';
import 'pages/404/error_page.dart';
import 'pages/authentication/authentication.dart';
import 'pages/authentication/login_controller.dart';

void main() {
  Get.put(MenuController());
  Get.put(NavigationController());
  Get.put(LoginController());

  setPathUrlStrategy();
  TokenManager.instance.initToken();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Dash",
      theme: ThemeData(
          scaffoldBackgroundColor: light,
          textTheme: GoogleFonts.mulishTextTheme(Theme.of(context).textTheme)
              .apply(bodyColor: Colors.black),
          pageTransitionsTheme: PageTransitionsTheme(builders: {
            TargetPlatform.iOS: FadeUpwardsPageTransitionsBuilder(),
            TargetPlatform.android: FadeUpwardsPageTransitionsBuilder()
          }),
          primaryColor: Colors.blue),
      initialRoute: AuthenticationPageRoute,
      unknownRoute: GetPage(
          name: "not-found",
          page: () => PageNotFound(),
          transition: Transition.fadeIn),
      getPages: [
        GetPage(
          name: RootRoute,
          page: () => SiteLayout(),
        ),
        GetPage(
            name: AuthenticationPageRoute, page: () => AuthenticationPage()),
      ],
    );
  }
}
