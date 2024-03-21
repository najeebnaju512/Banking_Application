import 'package:digibank/core/constants/colors.dart';
import 'package:digibank/core/constants/global_text_style.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class GLMetrialButton extends StatelessWidget {
  const GLMetrialButton(
      {super.key,
      this.width,
      this.height,
      required this.color,
      this.txtClr,
      this.icon,
      required this.text,
      this.style,
      this.route});

  final double? width;
  final double? height;
  final color;
  final Color? txtClr;
  final IconData? icon;
  final text;
  final style;
  final route;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: () {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => route));
      },
      minWidth: width,
      height: height,
      color: color,
      textColor: txtClr,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: icon == null
          ? Center(
              child: Text(
                text,
                style: GLTextStyles.labeltxtwhite,
              ),
            )
          : Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                FaIcon(
                  icon,
                  color: ColorTheme.white,
                ),
                const SizedBox(width: 10),
                Text(
                  text,
                  style: GLTextStyles.labeltxtwhite,
                ),
              ],
            ),
    );
  }
}
