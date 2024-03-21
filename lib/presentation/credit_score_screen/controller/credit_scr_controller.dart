import 'dart:math';
import 'package:flutter/material.dart';

class CreditScrController extends ChangeNotifier {
  late double value;

  CreditScrController() {
    generateRandomValue();
  }

  void generateRandomValue() {
    Random random = Random();
    value = 450.0 + random.nextDouble() * (900.0 - 450.0);
    value= double.parse(value.toStringAsFixed(0));
    notifyListeners();
  }
}
