import 'package:flutter/material.dart';
import 'package:green_io/src/model/cart_item.dart';
import 'package:green_io/src/model/order.dart';
import 'package:green_io/src/pages/orders/components/order_status.dart';
import 'package:green_io/src/pages/orders/components/payment_dialog.dart';
import 'package:green_io/src/services/util_services.dart';
import 'package:green_io/src/widgets/green_io_buttons.dart';

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
          expandedCrossAxisAlignment: CrossAxisAlignment.stretch,
          initiallyExpanded: order.stats == 'pending_payment',
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
            IntrinsicHeight(
              child: Row(
                children: [
                  Expanded(
                    flex: 3,
                    child: SizedBox(
                      height: 150,
                      child: ListView(
                        children: order.items.map((e) => _OrdemItemWidget(cartItem: e)).toList(),
                      ),
                    ),
                  ),
                  VerticalDivider(
                    color: Colors.grey.shade300,
                    thickness: 2,
                  ),
                  Expanded(
                    flex: 2,
                    child: OrderStatus(
                      status: order.stats,
                      isOverdue: order.overdueDateTime.isBefore(DateTime.now()),
                    ),
                  ),
                ],
              ),
            ),
            Text.rich(
              TextSpan(
                  style: const TextStyle(
                    fontSize: 20,
                  ),
                  children: [
                    const TextSpan(
                      text: 'Total ',
                    ),
                    TextSpan(
                      text: UtilsServices.priceToCurrency(order.total),
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ]),
            ),
            Visibility(
              visible: order.stats == 'pending_payment',
              child: GreenIOIconButton(
                label: 'Ver QR Code PIX',
                onPressed: () => showDialog(
                  context: context,
                  builder: (context) => PaymentDialog(order: order),
                ),
                icon: Icons.pix_rounded,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _OrdemItemWidget extends StatelessWidget {
  final CartItem cartItem;
  const _OrdemItemWidget({
    required this.cartItem,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        children: [
          Text(
            '${cartItem.quantity} ${cartItem.item.unit} ',
            style: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          Expanded(child: Text(cartItem.item.name)),
          Text(UtilsServices.priceToCurrency(cartItem.totalPrice())),
        ],
      ),
    );
  }
}
