import 'package:digibank/presentation/account_summary_screen/controller/account_summary_control.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/constants/colors.dart';
import '../../../../core/constants/global_text_style.dart';



class BalanceCard extends StatelessWidget {
  const BalanceCard({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Consumer<ACCSumaryCantrol>(
      builder: (context, aScontol, child) {
        return Container(
          width: size.width * .75,
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          decoration: BoxDecoration(
              color: ColorTheme.darkClr,
              borderRadius: BorderRadius.circular(10)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Balance",
                style: GLTextStyles.bodyTextwhite,
              ),
              Center(
                child: Text(
                  "${aScontol.balance}",
                  style: GLTextStyles.subtitleWhite,
                ),
              ),
              Center(
                child: Text(
                  "Total Savings and Deposits",
                  style: GLTextStyles.subtitleWhite3,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
