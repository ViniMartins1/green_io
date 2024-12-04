import 'package:flutter/material.dart';
import 'package:green_io/src/config/app_colors.dart';

class QuantitySelect extends StatelessWidget {
  final int value;
  final String sufixText;
  final Function(int quantity) result;
  final bool removable;
  const QuantitySelect({
    super.key,
    required this.value,
    required this.sufixText,
    required this.result,
    this.removable = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(50),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade300,
            spreadRadius: 1,
            blurRadius: 2,
          ),
        ],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          _QuantityButton(
            color: !removable || value > 1 ? Colors.grey : Colors.red,
            icon: !removable || value > 1 ? Icons.remove_rounded : Icons.delete_forever_rounded,
            onPressed: () {
              if (value == 1 && !removable) return;
              int resultCount = value - 1;
              result(resultCount);
            },
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Text(
              '$value $sufixText',
              style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          _QuantityButton(
            color: AppColors.appSwatchColor,
            icon: Icons.add_rounded,
            onPressed: () {
              int res = value + 1;

              result(res);
            },
          ),
        ],
      ),
    );
  }
}

class _QuantityButton extends StatelessWidget {
  final Color color;
  final IconData icon;
  final VoidCallback onPressed;
  const _QuantityButton({
    required this.color,
    required this.icon,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      child: InkWell(
        borderRadius: BorderRadius.circular(50),
        onTap: () => onPressed.call(),
        child: Ink(
          height: 25,
          width: 25,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: color,
          ),
          child: Icon(
            icon,
            color: Colors.white,
            size: 16,
          ),
        ),
      ),
    );
  }
}
