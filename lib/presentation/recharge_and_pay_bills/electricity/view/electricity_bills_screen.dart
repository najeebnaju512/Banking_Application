import 'package:digibank/global_widget/title_and_textformfield.dart';
import 'package:digibank/presentation/recharge_and_pay_bills/electricity/controller/electricity_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/constants/colors.dart';
import '../../../../core/constants/global_text_style.dart';
import '../../../../global_widget/global_appbar.dart';
import '../../../../global_widget/text_refactor.dart';
import '../../widget/mpin_paybills.dart';

class ElectricityBillsScreen extends StatefulWidget {
  const ElectricityBillsScreen({super.key});

  @override
  State<ElectricityBillsScreen> createState() => _ElectricityBillsScreenState();
}

class _ElectricityBillsScreenState extends State<ElectricityBillsScreen> {
  var amountController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: GLAppBar(
        title: "Electricity",
        centerTitle: true,
        titleTextStyle: GLTextStyles.titleStyle,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back)),
      ),
      body: Center(
        // ignore: sized_box_for_whitespace
        child: Container(
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
              Consumer<ElectricityController>(
                  builder: (builder, electricityController, _) {
                return DropdownButton(
                    padding: const EdgeInsets.all(5),
                    isExpanded: true,
                    items: dropDownItems,
                    value: electricityController.providerSelected,
                    onChanged: (String? selectedProvider) {
                      electricityController.setProvider(selectedProvider!);
                    });
              }),
              const TitleAndTextFormField(text: "Enter Consumer Number"),
               TitleAndTextFormField(
                text: "Enter Amount",
                keyboardType: TextInputType.number,
                textEditingController:amountController,
              ),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => PayBillsMpin(
                                catagory: "Electricity",
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

List<DropdownMenuItem<String>> get dropDownItems {
  List<DropdownMenuItem<String>> menuItems = [
    const DropdownMenuItem(
        value: "KSEB",
        child: ListTile(
            leading: Image(
                width: 30,
                image: AssetImage("asset/electricity_icon/KSEB_Logo.png")),
            title: Text("KSEB"))),
    const DropdownMenuItem(
        value: "TATA Power",
        child: ListTile(
            leading: Image(
                width: 30,
                image:
                    AssetImage("asset/electricity_icon/Tata_Power_Logo.png")),
            title: Text("TATA Power"))),
    const DropdownMenuItem(
        value: "ADANI Power",
        child: ListTile(
            leading: Image(
                width: 30,
                image: AssetImage("asset/electricity_icon/adaniPower.png")),
            title: Text("ADANI Power"))),
  ];
  return menuItems;
}
