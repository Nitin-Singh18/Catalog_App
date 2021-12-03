import 'package:firstapp/models/homecontent.dart';

class CartModel {
  static final cartModel = CartModel._internal();

  CartModel._internal();

  factory CartModel() => cartModel;
//cata field
  late CatalogModel _cata;

  //collection of Ids - store Ids of each item
  final List<int> _itemIds = [];

  //get cata
  CatalogModel get cata => _cata;

  set cata(CatalogModel newCata) {
    assert(newCata != null);
    _cata = newCata;
  }

  //get items in the cart
  List<Item> get items => _itemIds.map((id) => _cata.getById(id)).toList();

  //get total price
  num get totalPrice =>
      items.fold(0, (total, current) => total + current.price);

  //ass item
  void add(Item item) {
    _itemIds.add(item.id);
  }

  //remove item
  void remove(Item item) {
    _itemIds.remove(item.id);
  }
}
