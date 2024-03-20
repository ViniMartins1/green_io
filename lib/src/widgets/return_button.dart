import 'package:flutter/material.dart';

class ReturnButton extends StatelessWidget {
  final Color? color;
  const ReturnButton({super.key, this.color});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 8,
      top: 8,
      child: SafeArea(
        child: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(
            Icons.arrow_back_ios_rounded,
            color: color ?? Colors.white,
          ),
        ),
      ),
    );
  }
}
