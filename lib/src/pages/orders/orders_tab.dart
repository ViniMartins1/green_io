import 'package:flutter/material.dart';

class OrdersTab extends StatelessWidget {
  const OrdersTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Orders'),
      ),
      // body: ListView.separated(
      //   padding: EdgeInsets.all(16),
      //   physics: BouncingScrollPhysics(),
      //   separatorBuilder: (context, index) => const SizedBox(height: 8),
      //   itemCount: ,
      //   itemBuilder: (context, index) => ,
      // ),
    );
  }
}
