import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


Column IconBtn(BuildContext context,
    {required route, required title, required icon, required color,required style}) {
  return Column(
    children: [
      IconButton(
          onPressed: () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => route));
          },
          icon: FaIcon(
            icon,
            color: color,
          )),
      Text(
        title,
        style: style,
      )
    ],
  );
}
