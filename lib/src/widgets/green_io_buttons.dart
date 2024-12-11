import 'package:flutter/material.dart';
import 'package:green_io/src/config/app_colors.dart';

class GreenIOButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;
  final bool isLoading;
  const GreenIOButton({super.key, required this.label, required this.onPressed, this.isLoading = false});

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
        child: isLoading
            ? const CircularProgressIndicator()
            : Text(
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
  final bool isLoading;
  final IconData? icon;
  const GreenIOOutlinedButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.isLoading = false,
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
        child: isLoading
            ? const CircularProgressIndicator()
            : Row(
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
  final bool isLoading;
  final IconData icon;
  const GreenIOIconButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.isLoading = false,
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
        onPressed: isLoading ? null : onPressed,
        icon: isLoading ? const SizedBox.shrink() : Icon(icon),
        label: isLoading ? const CircularProgressIndicator(color: Colors.white) : Text(label),
      ),
    );
  }
}
