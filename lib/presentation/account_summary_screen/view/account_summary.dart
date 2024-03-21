import 'package:digibank/presentation/account_summary_screen/controller/account_summary_control.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/constants/colors.dart';
import '../../../core/constants/global_text_style.dart';
import '../../../global_widget/global_appbar.dart';

class AccountSummary extends StatefulWidget {
  const AccountSummary({super.key});

  @override
  State<AccountSummary> createState() => _AccountSummaryState();
}

class _AccountSummaryState extends State<AccountSummary> {
  @override
  void initState() {
    fetchData(context);
    super.initState();
  }

  fetchData(context) {
    Provider.of<ACCSumaryCantrol>(context, listen: false)
        .fetchProfileData(context);
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: GLAppBar(
        title: "Account Summary",
        centerTitle: true,
        titleTextStyle: GLTextStyles.titleStyle,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back)),
      ),
      body: Consumer<ACCSumaryCantrol>(
        builder: (context, aSControl, child) {
          return aSControl.isLoading
              ? const CircleAvatar()
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    Center(
                      child: Container(
                        width: size.width * .95,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 15, vertical: 10),
                        decoration: BoxDecoration(
                            color: ColorTheme.darkClr,
                            borderRadius: BorderRadius.circular(10)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Balance",
                              textAlign: TextAlign.center,
                              style: GLTextStyles.bodyTextwhite,
                            ),
                            Center(
                              child: Text(
                                "${aSControl.balance}",
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
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Center(
                      child: Container(
                        width: size.width * .95,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 15, vertical: 10),
                        decoration: BoxDecoration(
                            color: ColorTheme.darkClr,
                            borderRadius: BorderRadius.circular(10)),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Account No.",
                                  style: GLTextStyles.bodyTextwhite,
                                ),
                                Text(
                                  "${aSControl.maskedAccountNumber}",
                                  style: GLTextStyles.subtitleWhite2,
                                )
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "IFSC",
                                  style: GLTextStyles.bodyTextwhite,
                                ),
                                Text(
                                  "${aSControl.ifsc}",
                                  style: GLTextStyles.subtitleWhite2,
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Personal Details",
                            style: GLTextStyles.titleTextBlk,
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Text(
                            "Name",
                            style: GLTextStyles.subtitleGrey,
                          ),
                          Text(
                            "${aSControl.firstName} ${aSControl.lastName}",
                            style: GLTextStyles.subtitleBlk14,
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Text(
                            "Username",
                            style: GLTextStyles.subtitleGrey,
                          ),
                          Text(
                            "${aSControl.username}",
                            style: GLTextStyles.subtitleBlk14,
                          ),
                          const SizedBox(height: 15),
                          Text(
                            "Address",
                            style: GLTextStyles.subtitleGrey,
                          ),
                          Text(
                            "${aSControl.address}",
                            style: GLTextStyles.subtitleBlk14,
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Text(
                            "Mobile Number",
                            style: GLTextStyles.subtitleGrey,
                          ),
                          Text(
                            "+91 ${aSControl.mobileNo}",
                            style: GLTextStyles.subtitleBlk14,
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Text(
                            "Email",
                            style: GLTextStyles.subtitleGrey,
                          ),
                          Text(
                            "${aSControl.mailid}",
                            style: GLTextStyles.subtitleBlk14,
                          ),
                        ],
                      ),
                    ),
                  ],
                );
        },
      ),
    );
  }
}
