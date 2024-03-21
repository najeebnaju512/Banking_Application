import 'package:digibank/presentation/account_summary_screen/view/account_summary.dart';
import 'package:digibank/presentation/more_screen/view/more_screen.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../core/constants/colors.dart';
import '../../../../core/constants/global_text_style.dart';
import '../../../send_money_screen/view/send_money_screen.dart';
import 'icon_btn.dart';

Container UsersFunctions(Size size, BuildContext context) {
  return Container(
    width: size.aspectRatio,
    padding: const EdgeInsets.all(10),
    decoration: BoxDecoration(
        color: ColorTheme.darkClr, borderRadius: BorderRadius.circular(10)),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        IconBtn(context,
            route: const SendMoney(),
            title: "Send Money",
            icon: FontAwesomeIcons.moneyBillTransfer,
            style: GLTextStyles.labeltxtwhite,
            color: ColorTheme.white),
        IconBtn(context,
            route: const AccountSummary(),
            title: "Account Summary",
            icon: FontAwesomeIcons.idCardClip,
            style: GLTextStyles.labeltxtwhite,
            color: ColorTheme.white),
        IconBtn(context,
            route: const MoreScreen(),
            title: "More",
            icon: FontAwesomeIcons.ellipsis,
            color: ColorTheme.white,
            style: GLTextStyles.labeltxtwhite),
      ],
    ),
  );
}
