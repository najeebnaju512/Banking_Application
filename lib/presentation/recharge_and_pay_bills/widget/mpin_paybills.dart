import 'package:digibank/presentation/recharge_and_pay_bills/controller/paybills_controller.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import 'package:provider/provider.dart';

import '../../../core/constants/colors.dart';
import '../../../global_widget/text_refactor.dart';

class PayBillsMpin extends StatefulWidget {
  const PayBillsMpin(
      {super.key,
      required this.catagory,
      required this.amount});

  final String catagory;
  final String amount;
  @override
  State<PayBillsMpin> createState() => PayBillsStateMpin();
}

class PayBillsStateMpin extends State<PayBillsMpin> {
  var mpinController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Center(
        child: SizedBox(
          height: size.height * .6,
          width: size.width * 0.9,
          child: Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const TextRefactor(
                  text: "Enter MPIN",
                  textSize: 22,
                  textFontWeight: FontWeight.bold,
                ),
                Pinput(
                  length: 4,
                  controller: mpinController,
                  obscureText: true,
                  hapticFeedbackType: HapticFeedbackType.lightImpact,
                  validator: (value) {
                    if (value == null) {
                      return "Enter MPIN";
                    }
                    return null;
                  },
                ),
                ElevatedButton(
                  onPressed: () {
                    Provider.of<PayBillsController>(context, listen: false)
                        .onPayBill(widget.catagory,
                            widget.amount, mpinController.text, context);
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: ColorTheme.mainClr,
                      padding: EdgeInsets.only(
                          left: size.width * .2,
                          right: size.width * .2,
                          top: size.height * .02,
                          bottom: size.height * .02),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10))),
                  child: const TextRefactor(
                      text: "Confirm",
                      textSize: 16,
                      textFontWeight: FontWeight.bold),
                ),
                TextButton(
                    onPressed: () {},
                    child: const TextRefactor(text: "Forgot MPIN ?")),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
