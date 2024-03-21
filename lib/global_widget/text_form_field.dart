import 'package:flutter/material.dart';

class TextFormFieldRefactor extends StatelessWidget {
  const TextFormFieldRefactor({
    super.key,
    this.textEditingController,
    this.hintText,
  });

  final TextEditingController? textEditingController;
  final String? hintText;


  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: textEditingController,
      decoration: InputDecoration(hintText: hintText,
        border: const OutlineInputBorder(borderSide: BorderSide(width: .1, color: Colors.white54))
         ),
    );
  }
}
