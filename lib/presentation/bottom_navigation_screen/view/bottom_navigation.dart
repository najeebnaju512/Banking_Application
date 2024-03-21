import 'dart:developer';

import 'package:digibank/core/constants/global_text_style.dart';
import 'package:digibank/presentation/home_screen/view/home_screen.dart';
import 'package:digibank/presentation/profile_screen/view/profile_screen.dart';
import 'package:digibank/presentation/transaction_screen/view/transaction.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/constants/colors.dart';
import '../controller/bottom_nav_controller.dart';

class BottomNavigation extends StatelessWidget {
  const BottomNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        extendBody: true,
        body: Consumer<BottomNavigationController>(
          builder: (context, provider, child) {
            return IndexedStack(
              index: provider.currentIndex,
              children: const [HomeScreen(), TransactionScreen(), ProfileScreen()],
            );
          },
        ),
        bottomNavigationBar: Consumer<BottomNavigationController>(
          builder: (context, provider, child) {
            return Padding(
              padding: const EdgeInsets.only(left: 5, right: 5, bottom: 5),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: BottomNavigationBar(
                  onTap: (index) {
                    provider.currentIndex = index;
                    log("tapped ${provider.currentIndex}");
                  },
                  type: BottomNavigationBarType.shifting,
                  currentIndex: provider.currentIndex,
                  elevation: 0,
                  backgroundColor: ColorTheme.white,
                  unselectedItemColor: ColorTheme.black,
                  selectedItemColor: ColorTheme.darkClr,
                  showSelectedLabels: true,
                  showUnselectedLabels: false,
                  selectedLabelStyle: GLTextStyles.bottomlabel,
                  items: [
                    BottomNavigationBarItem(
                        icon: const Icon(
                          Icons.home,
                        ),
                        label: "Home",
                        activeIcon: const Icon(Icons.home_filled),
                        backgroundColor: ColorTheme.white),
                    BottomNavigationBarItem(
                        icon: const Icon(
                          Icons.payments_outlined,
                        ),
                        label: "Transaction",
                        activeIcon: const Icon(Icons.payments),
                        backgroundColor: ColorTheme.white),
                    BottomNavigationBarItem(
                        icon: const Icon(
                          Icons.person_2_outlined,
                        ),
                        label: "Profile",
                        activeIcon: const Icon(Icons.person_2),
                        backgroundColor: ColorTheme.white),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
