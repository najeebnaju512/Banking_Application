import 'package:digibank/presentation/send_money_screen/controller/send_money_controller.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import 'package:provider/provider.dart';

import '../../../../core/constants/colors.dart';
import '../../../../global_widget/text_refactor.dart';

class MpinValidationScreen extends StatefulWidget {
  const MpinValidationScreen(
      {super.key,
      required this.accountNumber,
      required this.reEnterAccountNumber,
      required this.ifsc,
      required this.receiversUsername,
      required this.amount});

  final String accountNumber;
  final String reEnterAccountNumber;
  final String ifsc;
  final String receiversUsername;
  final String amount;

  @override
  State<MpinValidationScreen> createState() => _MpinValidationScreenState();
}

class _MpinValidationScreenState extends State<MpinValidationScreen> {
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
                    Provider.of<SendMoneyController>(context,listen: false).onSendSameBank(widget.accountNumber, widget.reEnterAccountNumber,
                        widget.ifsc, widget.receiversUsername, widget.amount, mpinController.text, context);
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: ColorTheme.mainClr,
                      padding: EdgeInsets.only(
                          left: size.width * .2,
                          right: size.width * .2,
                          top: size.height * .02,
                          bottom: size.height * .02),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
                  child: const TextRefactor(text: "Confirm", textSize: 16, textFontWeight: FontWeight.bold),
                ),
                TextButton(onPressed: () {}, child: const TextRefactor(text: "Forgot MPIN ?")),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
