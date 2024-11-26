import 'package:green_io/src/model/cart_item.dart';

class Order {
  int id;
  DateTime createdDateTime;
  DateTime overdueDateTime;
  List<CartItem> items;
  String stats;
  String copyAndPaste;
  double total;

  Order({
    required this.id,
    required this.createdDateTime,
    required this.overdueDateTime,
    required this.items,
    required this.stats,
    required this.copyAndPaste,
    required this.total,
  });
}
