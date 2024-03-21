import 'package:flutter/material.dart';

class ElectricityController extends ChangeNotifier {
  String? providerSelected;

  void setProvider(String selectedProvider) {
    providerSelected = selectedProvider;
    notifyListeners();
  }
}
