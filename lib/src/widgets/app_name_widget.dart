import 'package:flutter/material.dart';

class AppNameWidget extends StatelessWidget {
  final double fontSize;
  const AppNameWidget({super.key, this.fontSize = 30});

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        style: TextStyle(fontSize: fontSize),
        children: const [
          TextSpan(text: 'green', style: TextStyle(color: Colors.white)),
          TextSpan(text: '.', style: TextStyle(color: Colors.black)),
          TextSpan(text: 'io', style: TextStyle(color: Colors.amber)),
        ],
      ),
    );
  }
}
