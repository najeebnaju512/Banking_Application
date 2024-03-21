import 'package:flutter/material.dart';

class TextRefactor extends StatelessWidget {
  const TextRefactor(
      {super.key,
      required this.text,
      this.textSize,
      this.textFontWeight = FontWeight.normal,
      this.textColor = Colors.black});

  final String text;
  final double? textSize;
  final FontWeight? textFontWeight;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    return Text(text,
        style: TextStyle(fontSize: textSize, fontWeight: textFontWeight, color: textColor));
  }
}
