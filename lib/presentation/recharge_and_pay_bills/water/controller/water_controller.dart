import 'package:flutter/material.dart';

class WaterController extends ChangeNotifier {
  String? providerSelected;

  void setProvider(String selectedProvider) {
    providerSelected = selectedProvider;
    notifyListeners();
  }
}
