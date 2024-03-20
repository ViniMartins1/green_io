import 'package:green_io/src/model/item.dart';

class CartItem {
  Item item;
  int quantity;

  CartItem({
    required this.item,
    required this.quantity,
  });

  double totalPrice() => item.price * quantity;
}
