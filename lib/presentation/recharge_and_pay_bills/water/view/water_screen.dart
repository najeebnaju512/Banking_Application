import 'package:digibank/global_widget/title_and_textformfield.dart';
import 'package:digibank/presentation/recharge_and_pay_bills/water/controller/water_controller.dart';
import 'package:digibank/presentation/recharge_and_pay_bills/widget/mpin_paybills.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/constants/colors.dart';
import '../../../../core/constants/global_text_style.dart';
import '../../../../global_widget/global_appbar.dart';
import '../../../../global_widget/text_refactor.dart';

class WaterBillsScreen extends StatelessWidget {
  const WaterBillsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var amountController = TextEditingController();
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: GLAppBar(
        title: "Water",
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
              Consumer<WaterController>(builder: (context, waterController, _) {
                return DropdownButton(
                    padding: const EdgeInsets.all(5),
                    isExpanded: true,
                    value: waterController.providerSelected,
                    items: dropdownItems,
                    onChanged: (String? selectedProvider) {
                      waterController.setProvider(selectedProvider!);
                    });
              }),
              const TitleAndTextFormField(text: "Enter Consumer ID"),
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
                                catagory: "Water",
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
      value: "Kerala Water Authority(KWA)",
      child: ListTile(
          leading:
              Image(width: 30, image: AssetImage("asset/water_icon/kwa.png")),
          title: Text("Kerala Water Authority(KWA)")),
    )
  ];
  return menuItems;
}
