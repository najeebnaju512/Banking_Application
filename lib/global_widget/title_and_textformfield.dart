import 'package:flutter/material.dart';

class TitleAndTextFormField extends StatelessWidget {
  const TitleAndTextFormField(
      {super.key,
      required this.text,
      this.textSize,
      this.textFontWeight,
      this.textColor,
      this.textEditingController,
      this.hintText,
      this.keyboardType});

  final String text;
  final double? textSize;
  final FontWeight? textFontWeight;
  final Color? textColor;
  final TextEditingController? textEditingController;
  final String? hintText;
  final TextInputType? keyboardType;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SizedBox(
      height: size.height * 0.15,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(text,
              style: TextStyle(
                  fontSize: textSize,
                  fontWeight: textFontWeight,
                  color: textColor)),
          TextFormField(
            controller: textEditingController,
            keyboardType: keyboardType,
            decoration: const InputDecoration(
                border: OutlineInputBorder(
                    borderSide: BorderSide(width: .1, color: Colors.white54))),
          )
        ],
      ),
    );
  }
}
