import 'package:digibank/core/constants/colors.dart';
import 'package:digibank/core/constants/global_text_style.dart';
import 'package:flutter/material.dart';

class GLAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final Widget? leading;
  final List<Widget>? actions;
  final bool? centerTitle;
  final TextStyle? titleTextStyle;

  const GLAppBar({super.key, 
    this.title,
    this.leading,
    this.actions,
    this.centerTitle = true,
    this.titleTextStyle,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title!, style: GLTextStyles.titleStyle),
      titleTextStyle: GLTextStyles.titleStyle,
      centerTitle: centerTitle,
      backgroundColor: ColorTheme.white,
      surfaceTintColor: ColorTheme.white,
      leading: leading,
      actions: actions,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
