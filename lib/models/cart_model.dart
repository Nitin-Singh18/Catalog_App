import 'package:firstapp/core/store.dart';
import 'package:firstapp/models/homecontent.dart';
import 'package:velocity_x/velocity_x.dart';

class CartModel {
  // static final cartModel = CartModel._internal();

  // CartModel._internal();

  // factory CartModel() => cartModel;
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

  // //remove item
  // void remove(Item item) {
  //   _itemIds.remove(item.id);
  // }
}

class AddMutation extends VxMutation<MyStore> {
  final Item item;

  AddMutation(this.item);

  @override
  perform() {
    // TODO: implement perform
    store!.cart._itemIds.add(item.id);
  }
}

class RemoveMutation extends VxMutation<MyStore> {
  final Item item;

  RemoveMutation(this.item);

  @override
  perform() {
    // TODO: implement perform
    store!.cart._itemIds.remove(item.id);
  }
}
