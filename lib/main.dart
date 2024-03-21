import 'package:digibank/presentation/account_summary_screen/controller/account_summary_control.dart';
import 'package:digibank/presentation/credit_score_screen/controller/credit_scr_controller.dart';
import 'package:digibank/presentation/home_screen/controller/home_controler.dart';
import 'package:digibank/presentation/login_screen/controller/login_controller.dart';
import 'package:digibank/presentation/profile_screen/controller/profile_controller.dart';
import 'package:digibank/presentation/recharge_and_pay_bills/controller/paybills_controller.dart';
import 'package:digibank/presentation/recharge_and_pay_bills/electricity/controller/electricity_controller.dart';
import 'package:digibank/presentation/recharge_and_pay_bills/mobile_recharge/controller/operator_controller.dart';
import 'package:digibank/presentation/recharge_and_pay_bills/water/controller/water_controller.dart';
import 'package:digibank/presentation/registration_screen/controller/registration_controller.dart';
import 'package:digibank/presentation/request_loan_screen/controller/loan_type_controller.dart';
import 'package:digibank/presentation/send_money_screen/controller/send_money_controller.dart';
import 'package:digibank/presentation/splash_screen/view/splash_screen.dart';
import 'package:digibank/presentation/transaction_screen/controller/transaction_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import 'core/constants/colors.dart';
import 'presentation/bottom_navigation_screen/controller/bottom_nav_controller.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(statusBarColor: Colors.white, statusBarIconBrightness: Brightness.dark));
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (context) => BottomNavigationController()),
    ChangeNotifierProvider(create: (context) => LoginController()),
    ChangeNotifierProvider(create: (context) => HomeScreenController()),
    ChangeNotifierProvider(create: (context) => ProfileController()),
    ChangeNotifierProvider(create: (context) => OperatorController()),
    ChangeNotifierProvider(create: (context) => TransactionController()),
    ChangeNotifierProvider(create: (context) => ACCSumaryCantrol()),
    ChangeNotifierProvider(create: (context) => ElectricityController()),
    ChangeNotifierProvider(create: (context) => CreditScrController()),
    ChangeNotifierProvider(create: (context) => WaterController()),
    ChangeNotifierProvider(create: (context) => LoanTypeController()),
    ChangeNotifierProvider(create: (context) => RegistrationController()),
    ChangeNotifierProvider(create: (context) => SendMoneyController()),
     ChangeNotifierProvider(create: (context) => PayBillsController()),
    // ChangeNotifierProvider(create: (context) => ),
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // var isDark = MediaQuery.of(context).platformBrightness == Brightness.dark;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'DigiBank',
      theme: /*isDark == true ? ThemeData.dark() : ThemeData.light()*/
          ThemeData(scaffoldBackgroundColor: ColorTheme.white),
      home: const SplashScreen(),
    );
  }
}
