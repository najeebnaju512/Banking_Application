import 'package:digibank/global_widget/text_refactor.dart';
import 'package:digibank/presentation/login_screen/controller/login_controller.dart';
import 'package:digibank/presentation/registration_screen/view/registration.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import 'package:provider/provider.dart';

import '../../../core/constants/colors.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
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
                  text: "Login using MPIN",
                  textSize: 22,
                  textFontWeight: FontWeight.bold,
                ),
                const TextRefactor(text: "MPIN", textSize: 18),
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
                    Provider.of<LoginController>(context, listen: false)
                        .onLogin(mpinController.text, context);
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
                      text: "Login",
                      textSize: 16,
                      textFontWeight: FontWeight.bold),
                ),
                TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  const RegistrationScreen()));
                      mpinController.clear();
                    },
                    child: const TextRefactor(text: "Forgot MPIN ?")),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
