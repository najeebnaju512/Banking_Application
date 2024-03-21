import 'package:flutter/material.dart';

class LoanTypeController extends ChangeNotifier {
  String? loantypeSelected;

  void setOperator(String selectedLoantype) {
      loantypeSelected = selectedLoantype;
    notifyListeners();
  }
}
