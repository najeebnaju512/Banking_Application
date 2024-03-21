import 'dart:async';

import 'package:digibank/app_config/app_config.dart';
import 'package:digibank/presentation/login_screen/view/login_screen.dart';
import 'package:digibank/presentation/registration_screen/view/registration.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late SharedPreferences sharedPreferences;
  late bool checkLogged;

  Future<void> checkUserRegistered() async {
    sharedPreferences = await SharedPreferences.getInstance();
    checkLogged = sharedPreferences.getBool(AppConfig.status) ?? false;
  }

  @override
  void initState() {
    checkUserRegistered().then((_) {
      Timer(const Duration(seconds: 4), () {
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => checkLogged ? const LoginScreen() : const RegistrationScreen()));
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Center(
        child: SizedBox(
            height: size.height * .4,
            child: Image.asset(
              'asset/splash/DB.png',
              fit: BoxFit.fill,
            )),
      ),
    );
  }
}
