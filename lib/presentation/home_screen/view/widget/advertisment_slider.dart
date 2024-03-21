
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../controller/home_controler.dart';



class AdvertisementSlider extends StatelessWidget {
  const AdvertisementSlider({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeScreenController>(builder: (context, hContol, child) {
      return SizedBox(
        width: size.aspectRatio,
            height: size.height*.2,
        child: CarouselSlider.builder(
        itemCount: hContol.imageList.length,
        itemBuilder: (context, index, realIndex) {
          return Container(
            
            height: size.height*.2,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                    image: AssetImage(hContol.imageList[index]), fit: BoxFit.cover)
                    ),
          );
        },
        options: CarouselOptions(
          autoPlay: true,
          height: size.height*.2,
          // aspectRatio: 0,
          enableInfiniteScroll: true,
          viewportFraction: 1,
        )),
      );
    },);
  }
}