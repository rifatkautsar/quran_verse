import 'package:flutter/material.dart';

class CustomTextWithSizeWhite extends StatelessWidget {
  final String valueText;
  final double textSize;

  const CustomTextWithSizeWhite(
      {super.key, required this.valueText, required this.textSize});

  @override
  Widget build(BuildContext context) {
    return Text(
      valueText,
      style: TextStyle(
        fontSize: textSize,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}

class CustomTextWithSizeCustomColor extends StatelessWidget {
  final String valueText;
  final double textSize;
  final Color colorText;

  const CustomTextWithSizeCustomColor(
      {super.key,
      required this.valueText,
      required this.textSize,
      required this.colorText});

  @override
  Widget build(BuildContext context) {
    return Text(
      valueText,
      style: TextStyle(
        fontSize: textSize,
        color: colorText,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
