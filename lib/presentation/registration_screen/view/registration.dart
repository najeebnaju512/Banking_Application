import 'package:digibank/core/constants/colors.dart';
import 'package:digibank/global_widget/text_refactor.dart';
import 'package:digibank/global_widget/title_and_textformfield.dart';
import 'package:digibank/presentation/registration_screen/controller/registration_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/constants/global_text_style.dart';

class RegistrationScreen extends StatelessWidget {
  const RegistrationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var usernameTextEditingController = TextEditingController();
    var accountTextEditingController = TextEditingController();
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Center(
        child: SizedBox(
          height: size.height * .6,
          width: size.width * 0.9,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                  child: Text(
                    'digiBank.',
                    style: GLTextStyles.digiBankYellow,
                  )),
              const Center(
                child: TextRefactor(
                    text: "Register your account",
                    textSize: 22,
                    textFontWeight: FontWeight.bold),
              ),
              Column(
                children: [
                  TitleAndTextFormField(
                    text: "Username",
                    textSize: 18,
                    textEditingController: usernameTextEditingController,
                  ),
                  TitleAndTextFormField(
                    text: "Account Number",
                    textSize: 18,
                    textEditingController: accountTextEditingController,
                  ),
                ],
              ),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    Provider.of<RegistrationController>(context, listen: false)
                        .onRegistration(usernameTextEditingController.text,
                            accountTextEditingController.text, context);
                    usernameTextEditingController.clear();
                    accountTextEditingController.clear();
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
                      text: "SIGN IN",
                      textSize: 16,
                      textFontWeight: FontWeight.bold),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
