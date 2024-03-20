import 'package:flutter/material.dart';
import 'package:green_io/src/config/app_colors.dart';
import 'package:green_io/src/model/cart_item.dart';
import 'package:green_io/src/services/util_services.dart';
import 'package:green_io/src/widgets/quantity_select.dart';

class CartTile extends StatefulWidget {
  final CartItem cartItem;
  final Function(CartItem) remove;
  const CartTile({
    super.key,
    required this.cartItem,
    required this.remove,
  });

  @override
  State<CartTile> createState() => _CartTileState();
}

class _CartTileState extends State<CartTile> {
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.fromLTRB(12, 12, 12, 0),
      child: ListTile(
        title: Text(
          widget.cartItem.item.name,
          style: const TextStyle(
            fontWeight: FontWeight.w500,
          ),
        ),
        subtitle: Text(
          UtilsServices.priceToCurrency(widget.cartItem.totalPrice()),
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: AppColors.appSwatchColor,
          ),
        ),
        leading: Image.asset(
          widget.cartItem.item.imgUrl,
          height: 60,
          width: 60,
        ),
        trailing: QuantitySelect(
          value: widget.cartItem.quantity,
          sufixText: widget.cartItem.item.unit,
          result: (quantity) {
            setState(() {
              widget.cartItem.quantity = quantity;
            });

            if (quantity == 0) {
              widget.remove(widget.cartItem);
            }
          },
          removable: true,
        ),
      ),
    );
  }
}
