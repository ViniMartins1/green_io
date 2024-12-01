import 'package:flutter/material.dart';
import 'package:green_io/src/config/app_colors.dart';

class OrderStatus extends StatelessWidget {
  final String status;
  final bool isOverdue;
  OrderStatus({super.key, required this.status, required this.isOverdue});

  final Map<String, int> orderStatus = <String, int>{
    'pending_payment': 0,
    'refunded': 1,
    'paid': 2,
    'preparing_purchase': 3,
    'shipping': 4,
    'delivered': 5,
  };

  int get currentStatus => orderStatus[status]!;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const _StatusDot(
          isActive: true,
          label: 'Confirmado',
        ),
        const _CustomDivider(),
        if (currentStatus == 1) ...[
          const _StatusDot(
            isActive: true,
            label: 'Estornado',
            color: Colors.orange,
          ),
        ] else if (isOverdue) ...[
          const _StatusDot(
            isActive: true,
            label: 'Pagamento vencido',
            color: Colors.red,
          ),
        ] else ...[
          _StatusDot(
            isActive: currentStatus >= 2,
            label: 'Pagamento',
          ),
          const _CustomDivider(),
          _StatusDot(
            isActive: currentStatus >= 3,
            label: 'Preparando',
          ),
          const _CustomDivider(),
          _StatusDot(
            isActive: currentStatus >= 4,
            label: 'Envio',
          ),
          const _CustomDivider(),
          _StatusDot(
            isActive: currentStatus == 5,
            label: 'Entregue',
          ),
        ]
      ],
    );
  }
}

class _StatusDot extends StatelessWidget {
  final bool isActive;
  final String label;
  final Color? color;
  const _StatusDot({required this.isActive, required this.label, this.color});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 20,
          width: 20,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: AppColors.appSwatchColor),
            color: isActive ? color ?? AppColors.appSwatchColor : Colors.transparent,
          ),
          child: isActive
              ? const Icon(
                  Icons.check_outlined,
                  size: 12,
                  color: Colors.white,
                )
              : const SizedBox.shrink(),
        ),
        const SizedBox(width: 4),
        Expanded(
          child: Text(
            label,
            style: const TextStyle(fontSize: 12),
          ),
        ),
      ],
    );
  }
}

class _CustomDivider extends StatelessWidget {
  const _CustomDivider();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      height: 12,
      width: 4,
      color: Colors.grey.shade300,
    );
  }
}
