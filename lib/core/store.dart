import 'package:firstapp/models/cart_model.dart';
import 'package:firstapp/models/homecontent.dart';
import 'package:velocity_x/velocity_x.dart';

class MyStore extends VxStore {
  late CatalogModel catalog;
  late CartModel cart;

  MyStore() {
    catalog = CatalogModel();
    cart = CartModel();
    cart.cata = catalog;
  }
}
