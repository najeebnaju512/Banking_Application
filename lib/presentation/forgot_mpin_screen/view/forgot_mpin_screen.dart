import 'package:digibank/global_widget/title_and_textformfield.dart';
import 'package:flutter/material.dart';

import '../../../core/constants/colors.dart';
import '../../../core/constants/global_text_style.dart';
import '../../../global_widget/text_refactor.dart';
import '../../bottom_navigation_screen/view/bottom_navigation.dart';

class ForgotMpinScreen extends StatelessWidget {
  const ForgotMpinScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Center(
        child: SizedBox(
          height: size.height * .4,
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
                    text: "Forgot MPIN ?",
                    textSize: 22,
                    textFontWeight: FontWeight.bold),
              ),
              const TitleAndTextFormField(text: "Enter Your Mobile Number"),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const BottomNavigation()));
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
