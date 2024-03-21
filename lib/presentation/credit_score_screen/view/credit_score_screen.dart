import 'package:digibank/presentation/credit_score_screen/controller/credit_scr_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

import '../../../core/constants/global_text_style.dart';
import '../../../global_widget/global_appbar.dart';

class CreditScrScreen extends StatelessWidget {
  CreditScrScreen({super.key});

  final CreditScrController creditController = CreditScrController();
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: GLAppBar(
        title: "Credit Score",
        centerTitle: true,
        titleTextStyle: GLTextStyles.titleStyle,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back)),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        child: Column(
          children: [

            Center(
                child: Text(
                  'digiBank.',
                  style: GLTextStyles.digiBankGrey,
                )),
            const SizedBox(height: 20,),
            Text(
              "Your Credit Report",
              style: GLTextStyles.labeltxtBlk16,
            ),
            const SizedBox(
              height: 10,
            ),
            Center(child: Consumer<CreditScrController>(
              builder: (context, crControl, child) {
                return SfRadialGauge(
                  axes: <RadialAxis>[
                    RadialAxis(
                      minimum: 300,
                      maximum: 900,
                      interval: 50,
                      ranges: <GaugeRange>[
                        GaugeRange(
                          startValue: 300,
                          endValue: 500,
                          color: Colors.red,
                        ),
                        GaugeRange(
                          startValue: 500,
                          endValue: 700,
                          color: Colors.orange,
                        ),
                        GaugeRange(
                          startValue: 700,
                          endValue: 800,
                          color: Colors.yellow,
                        ),
                        GaugeRange(
                          startValue: 800,
                          endValue: 900,
                          color: Colors.green,
                        ),
                      ],
                      pointers: <GaugePointer>[
                        NeedlePointer(
                          value: crControl.value,
                          enableAnimation: true,
                        )
                      ],
                      annotations: <GaugeAnnotation>[
                        GaugeAnnotation(
                          widget: Text(
                            "${crControl.value}",
                            style: GLTextStyles.labeltxtBlk20,
                          ),
                          positionFactor: 0.4,
                          angle: 90,
                        ),
                      ],
                    )
                  ],
                );
              },
            ))
          ],
        ),
      ),
    );
  }
}
