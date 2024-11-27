import 'package:flutter/material.dart';
import 'package:green_io/src/config/app_data.dart';
import 'package:green_io/src/pages/orders/components/order_tile.dart';

class OrdersTab extends StatelessWidget {
  const OrdersTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Orders'),
      ),
      body: ListView.separated(
        padding: const EdgeInsets.all(16),
        physics: const BouncingScrollPhysics(),
        separatorBuilder: (context, index) => const SizedBox(height: 8),
        itemCount: AppData.orders.length,
        itemBuilder: (context, index) => OrderTile(
          order: AppData.orders[index],
        ),
      ),
    );
  }
}
