// ignore: avoid_web_libraries_in_flutter

import 'package:flutter/material.dart';
import 'package:flutter_web_dashboard/pages/clients_page/add_client.dart';
import '../pages/orders_page/orders_page.dart';
import '../pages/overview_page/overview_page.dart';
import '../pages/products_page/add_product.dart';
import '../pages/products_page/products_page.dart';
import 'routes.dart';

import '../pages/clients_page/clients_page.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case OverViewPageRoute:
      return _getPageRoute(OverviewPage());
    case ProductPageRoute:
      return _getPageRoute(ProductsPage());
    case OrdersPageRoute:
      return _getPageRoute(OrdersPage());
    case ClientsPageRoute:
      return _getPageRoute(ClientsPage());
    case AddClientsPageRoute:
      return _getPageRoute(AddClientsPage());
    case AddProductsPageRoute:
      return _getPageRoute(AddProductPage());
    default:
      return _getPageRoute(OverviewPage());
  }
}

PageRoute _getPageRoute(Widget child) {
  return MaterialPageRoute(builder: (context) => child);
}
