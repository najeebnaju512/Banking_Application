import 'dart:developer';

import 'package:digibank/presentation/bottom_navigation_screen/view/bottom_navigation.dart';
import 'package:digibank/presentation/request_loan_screen/controller/loan_type_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/constants/global_text_style.dart';
import '../../../core/constants/colors.dart';
import '../../../global_widget/global_appbar.dart';
import '../../../global_widget/text_refactor.dart';
import '../../../global_widget/title_and_textformfield.dart';

class RequestLoanScreen extends StatelessWidget {
  const RequestLoanScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var nameController = TextEditingController();
    var mobController = TextEditingController();
    // var typeController = TextEditingController();
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: GLAppBar(
        title: "Request Loan Here",
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(color: Colors.black, Icons.arrow_back),
        ),
      ),
      body: ListView(children: [
        Center(
          child: SizedBox(
            height: size.height * .8,
            width: size.width * 0.9,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Center(
                    child: Text(
                  'digiBank.',
                  style: GLTextStyles.digiBankGrey,
                )),
                TitleAndTextFormField(text: "Name", textEditingController: nameController),
                TitleAndTextFormField(
                  text: "Mobile Number",
                  textEditingController: mobController,
                ),
                Consumer<LoanTypeController>(builder: (context, operatorController, _) {
                  return DropdownButton<String>(
                    padding: const EdgeInsets.all(5),
                    isExpanded: true,
                    value: operatorController.loantypeSelected,
                    hint: const Text("Select Loan Type"),
                    onChanged: (String? selectedLoantype) {
                      log('Selected Loan Type: $selectedLoantype');
                      operatorController.setOperator(selectedLoantype!);
                    },
                    items: dropdownItems,
                  );
                }),
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                                  backgroundColor: Colors.white,
                                  title: Text(
                                    'Our customer service will contact you as soon as possible.',
                                    style: GLTextStyles.labeltxtBlk16300,
                                  ),
                                  actions: [
                                    ElevatedButton(
                                      onPressed: () {
                                        Navigator.pushAndRemoveUntil(
                                            context, MaterialPageRoute(builder: (context) => const BottomNavigation()), (route) => false);
                                      },
                                      child: Text(
                                        "Okay",
                                        style: TextStyle(color: ColorTheme.darkClr),
                                      ),
                                    )
                                  ]));
                      nameController.clear();
                      mobController.clear();
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: ColorTheme.mainClr,
                        padding: EdgeInsets.only(left: size.width * .2, right: size.width * .2, top: size.height * .02, bottom: size.height * .02),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
                    child: const TextRefactor(text: "PROCEED", textSize: 16, textFontWeight: FontWeight.bold),
                  ),
                )
              ],
            ),
          ),
        ),
      ]),
    );
  }
}

List<DropdownMenuItem<String>> get dropdownItems {
  List<DropdownMenuItem<String>> menuItems = [
    const DropdownMenuItem(value: "Home", child: ListTile(title: Text("Home"))),
    const DropdownMenuItem(value: "Educational", child: ListTile(title: Text("Educational"))),
    const DropdownMenuItem(value: "Vehicle", child: ListTile(title: Text("Vehicle"))),
  ];
  return menuItems;
}
