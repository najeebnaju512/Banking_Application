import 'package:digibank/presentation/account_summary_screen/view/account_summary.dart';
import 'package:digibank/presentation/home_screen/controller/home_controler.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/constants/colors.dart';
import '../../../../core/constants/global_text_style.dart';

Consumer<HomeScreenController> userDetailsCard(
    Size size, String name, int accountNumber, double balance) {
  return Consumer<HomeScreenController>(
    builder: (context, hControl, child) {
      return Container(
        width: size.aspectRatio,
        padding: const EdgeInsets.only(left: 8, right: 8, top: 15, bottom: 5),
        decoration: BoxDecoration(
          color: ColorTheme.white,
          border: Border.all(
            color: ColorTheme.black,
            width: 1,
          ),
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.9),
              spreadRadius: 3,
              blurRadius: 5,
              offset: const Offset(0, 5), // changes position of shadow
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Account",
              style: GLTextStyles.bodyTextGrey,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  name,
                  style: GLTextStyles.titleTextBlk,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "${hControl.maskedAccountNumber}",
                  style: GLTextStyles.subtitleBlk,
                ),
                TextButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const AccountSummary()));
                    },
                    child: Text(
                      "View Balance",
                      style: GLTextStyles.bodyTextGrey,
                    ))
              ],
            )
          ],
        ),
      );
    },
  );
}
