import 'package:flutter/material.dart';
import 'package:green_io/src/model/order.dart';
import 'package:green_io/src/services/util_services.dart';
import 'package:green_io/src/widgets/green_io_buttons.dart';
import 'package:qr_flutter/qr_flutter.dart';

class PaymentDialog extends StatelessWidget {
  final Order order;
  const PaymentDialog({super.key, required this.order});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  'Pagamento com PIX',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                QrImageView.withQr(
                  qr: QrCode.fromData(
                    data: 'https://www.youtube.com/watch?v=dQw4w9WgXcQ',
                    errorCorrectLevel: 1,
                  ),
                ),
                Text(
                  'Overdue time: ${UtilsServices.formatDateTime(order.overdueDateTime)}',
                  style: const TextStyle(fontSize: 12),
                ),
                Text(
                  'Total: ${UtilsServices.priceToCurrency(order.total)}',
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                GreenIOOutlinedButton(
                  label: 'Copiar código PIX',
                  icon: Icons.copy_rounded,
                  onPressed: () {},
                ),
              ],
            ),
          ),
          Positioned(
            top: 0,
            right: 0,
            child: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.close_rounded,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
