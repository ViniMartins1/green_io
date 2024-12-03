import 'package:flutter/material.dart';
import 'package:green_io/src/config/app_colors.dart';

class GreenIOButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;
  const GreenIOButton({super.key, required this.label, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18),
          ),
        ),
        child: Text(
          label,
          style: const TextStyle(fontSize: 18),
        ),
        onPressed: () => onPressed.call(),
      ),
    );
  }
}

class GreenIOOutlinedButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;
  final IconData? icon;
  const GreenIOOutlinedButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18),
          ),
          side: BorderSide(
            width: 2,
            color: AppColors.appSwatchColor,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Visibility(
              visible: icon != null,
              child: Row(
                children: [
                  Icon(icon),
                  const SizedBox(width: 4),
                ],
              ),
            ),
            Text(
              label,
              style: TextStyle(
                fontSize: 18,
                color: AppColors.appSwatchColor,
              ),
            ),
          ],
        ),
        onPressed: () async => onPressed.call(),
      ),
    );
  }
}

class GreenIOIconButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;
  final IconData icon;
  const GreenIOIconButton({
    super.key,
    required this.label,
    required this.onPressed,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: ElevatedButton.icon(
        style: ElevatedButton.styleFrom(
          foregroundColor: Colors.white,
          backgroundColor: AppColors.appSwatchColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18),
          ),
        ),
        onPressed: () async => onPressed.call(),
        icon: Icon(icon),
        label: Text(label),
      ),
    );
  }
}
