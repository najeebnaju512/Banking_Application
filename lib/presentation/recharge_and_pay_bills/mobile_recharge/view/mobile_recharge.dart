import 'dart:developer';

import 'package:digibank/global_widget/title_and_textformfield.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/constants/colors.dart';
import '../../../../core/constants/global_text_style.dart';
import '../../../../global_widget/global_appbar.dart';
import '../../../../global_widget/text_refactor.dart';
import '../../widget/mpin_paybills.dart';
import '../controller/operator_controller.dart';

class MobileRecharge extends StatelessWidget {
  const MobileRecharge({super.key});

  @override
  Widget build(BuildContext context) {
    var amountController = TextEditingController();
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: GLAppBar(
        title: "Recharge",
        centerTitle: true,
        titleTextStyle: GLTextStyles.titleStyle,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back)),
      ),
      body: Center(
        child: SizedBox(
          height: size.height * .5,
          width: size.width * 0.9,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Center(
                  child: Text(
                'digiBank.',
                style: GLTextStyles.digiBankGrey,
              )),
              const TitleAndTextFormField(text: "Enter Mobile Number"),
              Consumer<OperatorController>(
                  builder: (context, operatorController, _) {
                return DropdownButton<String>(
                  padding: const EdgeInsets.all(5),
                  isExpanded: true,
                  value: operatorController.operatorSelected,
                  hint: const Text("Select Operator"),
                  onChanged: (String? selectedOperator) {
                    log('Selected Operator: $selectedOperator');
                    operatorController.setOperator(selectedOperator!);
                  },
                  items: dropdownItems,
                );
              }),
              TitleAndTextFormField(
                text: "₹ Enter Amount",
                keyboardType: TextInputType.number,
                textEditingController: amountController,
              ),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => PayBillsMpin(
                                catagory: "Recharge",
                                amount: amountController.text)));
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
                      text: "PROCEED",
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

List<DropdownMenuItem<String>> get dropdownItems {
  List<DropdownMenuItem<String>> menuItems = [
    const DropdownMenuItem(
        value: "Airtel",
        child: ListTile(
            leading: Image(
                width: 30, image: AssetImage("asset/operator_icon/airtel.png")),
            title: Text("Airtel"))),
    const DropdownMenuItem(
        value: "BSNL",
        child: ListTile(
            leading: Image(
                width: 30, image: AssetImage("asset/operator_icon/bsnl.png")),
            title: Text("BSNL"))),
    const DropdownMenuItem(
        value: "Jio",
        child: ListTile(
            leading: Image(
                width: 30, image: AssetImage("asset/operator_icon/jio.png")),
            title: Text("Jio"))),
    const DropdownMenuItem(
        value: "VI",
        child: ListTile(
            leading: Image(
                width: 30, image: AssetImage("asset/operator_icon/vi.png")),
            title: Text("data")))
  ];
  return menuItems;
}
