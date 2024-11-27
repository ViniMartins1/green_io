import 'package:flutter/material.dart';
import 'package:green_io/src/model/order.dart';
import 'package:green_io/src/services/util_services.dart';

class OrderTile extends StatelessWidget {
  final Order order;
  const OrderTile({super.key, required this.order});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Theme(
        data: Theme.of(context).copyWith(
          dividerColor: Colors.transparent,
        ),
        child: ExpansionTile(
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Pedido #${order.id}'),
              Text(UtilsServices.formatDateTime(order.createdDateTime)),
            ],
          ),
          childrenPadding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
          children: [
            SizedBox(
              height: 150,
              child: Row(
                children: [
                  Expanded(
                      flex: 3,
                      child: ListView(
                        children: order.items
                            .map((e) => Row(
                                  children: [Text('${e.quantity} ${e.item.unit}')],
                                ))
                            .toList(),
                      )),
                  Expanded(flex: 2, child: Container(color: Colors.blue)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
