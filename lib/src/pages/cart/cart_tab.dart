import 'package:flutter/material.dart';
import 'package:green_io/src/config/app_colors.dart';
import 'package:green_io/src/config/app_data.dart';
import 'package:green_io/src/model/cart_item.dart';
import 'package:green_io/src/widgets/green_io_buttons.dart';
import 'package:green_io/src/pages/cart/components/cart_tile.dart';
import 'package:green_io/src/services/util_services.dart';

class CartTab extends StatefulWidget {
  const CartTab({super.key});

  @override
  State<CartTab> createState() => _CartTabState();
}

class _CartTabState extends State<CartTab> {
  List<CartItem> get cartItems => AppData.cartItems;

  void removeItem(CartItem cartItem) {
    setState(() {
      cartItems.remove(cartItem);
    });
  }

  double cartTotalPrice() {
    double result = 0;
    for (CartItem item in cartItems) {
      result += item.totalPrice();
    }
    return result;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cart'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: cartItems.length,
              itemBuilder: (context, index) => CartTile(
                cartItem: cartItems[index],
                remove: removeItem,
              ),
            ),
          ),
          const SizedBox(height: 20),
          Container(
            padding: const EdgeInsets.all(16),
            height: 150,
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(44),
              ),
              boxShadow: [
                BoxShadow(
                  color: Color.fromRGBO(224, 224, 224, 1),
                  blurRadius: 3,
                  spreadRadius: 2,
                )
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Text(
                  'Total',
                  style: TextStyle(fontSize: 12),
                ),
                Text(
                  UtilsServices.priceToCurrency(cartTotalPrice()),
                  style: TextStyle(
                    fontSize: 24,
                    color: AppColors.appSwatchColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                GreenIOButton(
                  label: 'Ok',
                  onPressed: () async {
                    bool? result = await showOrderConfirmation();
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Future<bool?> showOrderConfirmation() {
    return showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        title: const Text('Confirmation'),
        content: const Text('Do you want to confirm the order?'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context, false);
            },
            child: const Text('No'),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.appSwatchColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            child: const Text('Yes'),
            onPressed: () {
              Navigator.pop(context, true);
            },
          ),
        ],
      ),
    );
  }
}
