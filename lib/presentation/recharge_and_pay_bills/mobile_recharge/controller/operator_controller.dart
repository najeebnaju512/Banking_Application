import 'package:flutter/material.dart';

class OperatorController extends ChangeNotifier {
  String? operatorSelected;

  void setOperator(String selectedOperator) {
    operatorSelected = selectedOperator;
    notifyListeners();
  }
}
