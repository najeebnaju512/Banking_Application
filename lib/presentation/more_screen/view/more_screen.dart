import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../../core/constants/global_text_style.dart';
import '../../../global_widget/global_appbar.dart';

class MoreScreen extends StatelessWidget {
  const MoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GLAppBar(
        title: "More",
        centerTitle: true,
        titleTextStyle: GLTextStyles.titleStyle,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back)),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "Under Construction",
            style: GLTextStyles.labeltxtBlk20,
          ),
          LottieBuilder.asset("asset/animation/loading.json")
        ],
      ),
    );
  }
}
