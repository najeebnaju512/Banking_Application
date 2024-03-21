import 'package:digibank/core/constants/colors.dart';
import 'package:digibank/core/constants/global_text_style.dart';
import 'package:digibank/presentation/home_screen/controller/home_controler.dart';
import 'package:digibank/presentation/home_screen/view/widget/advertisment_slider.dart';
import 'package:digibank/presentation/home_screen/view/widget/buttons_for_loan.dart';
import 'package:digibank/presentation/home_screen/view/widget/tools_to_use.dart';
import 'package:digibank/presentation/home_screen/view/widget/user_details.dart';
import 'package:digibank/presentation/home_screen/view/widget/user_function.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../../global_widget/drawer_refactored.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    fetchData(context);
    super.initState();
  }

  fetchData(context) {
    Provider.of<HomeScreenController>(context, listen: false)
        .fetchProfileDataHomeScreen(context);
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var homeScreenController = Provider.of<HomeScreenController>(context);
    String? fullName =
        "${homeScreenController.firstName} ${homeScreenController.lastName}";
    int? accountNumber = homeScreenController.accNo;
    double? balance = homeScreenController.balance;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('digiBank',
              style: GoogleFonts.leagueSpartan(
                color: ColorTheme.darkClr,
                fontSize: 23.0,
                fontWeight: FontWeight.w600,
              )),
          centerTitle: false,
          actions: [
            IconButton(
                onPressed: () {
                  _showAlertDialog(context);
                },
                icon: const Icon(Icons.logout_outlined)),
            const SizedBox(
              width: 10,
            )
          ],
        ),
        drawer: const DrawerRefactored(),
        body:
            Consumer<HomeScreenController>(builder: (context, pControl, child) {
          return pControl.isLoading
              ? const Center(child: CircularProgressIndicator())
              : Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                  child: ListView(
                    children: [
                      //users functions card
                      UsersFunctions(size, context),
                      SizedBox(height: size.height * .05),
                      //user details
                      userDetailsCard(size, fullName, accountNumber!, balance!),
                      SizedBox(height: size.height * .05),
                      Text("Recharge & Pay Bills",
                          style: GLTextStyles.subtitleBlk),
                      SizedBox(height: size.height * .05),
                      //tools like recharge etc
                      ToolsToUse(size: size),
                      SizedBox(height: size.height * .05),
                      Text("Loans", style: GLTextStyles.subtitleBlk),
                      SizedBox(height: size.height * .02),
                      //buttons like emiCalculator and credit score
                      ButtonsForLoan(size: size),
                      SizedBox(height: size.height * .04),
                      // carousel slider for advertisement
                      AdvertisementSlider(size: size)
                    ],
                  ),
                );
        }),
      ),
    );
  }

  void _showAlertDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
                backgroundColor: Colors.white,
                title: Text(
                  'Do you wish to Logout',
                  style: GLTextStyles.labeltxtBlk16300,
                ),
                actions: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: Text(
                          "Cancel",
                          style: TextStyle(color: ColorTheme.darkClr),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          Provider.of<HomeScreenController>(context,listen: false)
                              .logOutFunction(context);
                        },
                        child: Text(
                          "Logout",
                          style: TextStyle(color: ColorTheme.darkClr),
                        ),
                      )
                    ],
                  )
                ]));
  }
}
