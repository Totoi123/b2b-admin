const RootRoute = "/";

const OverViewPageDisplayName = "Overview";
const OverViewPageRoute = "/overview";
const ClientsPageDisplayName = "Clients";
const ClientsPageRoute = "/clients";
const ProductsPageDisplayName = "Products";
const ProductPageRoute = "/products";
const OrdersPageDisplayName = "Orders";
const OrdersPageRoute = "/orders";

const AddClientsDisplayName = "Add Customers";
const AddClientsPageRoute = "/addclients";
const AddProductsPageRoute = "/addproducts";

const AuthenticationPageDisplayName = "Log Out";
const AuthenticationPageRoute = "/auth";

class MenuItem {
  final String name;
  final String route;

  MenuItem(this.name, this.route);
}

List<MenuItem> sideMenuItems = [
  MenuItem(OverViewPageDisplayName, OverViewPageRoute),
  MenuItem(ClientsPageDisplayName, ClientsPageRoute),
  MenuItem(ProductsPageDisplayName, ProductPageRoute),
  MenuItem(OrdersPageDisplayName, OrdersPageRoute),
  MenuItem(AuthenticationPageDisplayName, AuthenticationPageRoute),
];
