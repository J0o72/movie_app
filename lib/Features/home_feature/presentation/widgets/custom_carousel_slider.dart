import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/Features/home_feature/presentation/widgets/custom_image_carousel_item.dart';
import 'package:movie_app/constants.dart';

class CustomCarouselSlider extends StatefulWidget {
  const CustomCarouselSlider({super.key});

  @override
  State<CustomCarouselSlider> createState() => _CustomCarouselSliderState();
}

class _CustomCarouselSliderState extends State<CustomCarouselSlider>
    with SingleTickerProviderStateMixin {
  late CarouselSliderController innerCarouselController;
  int innerCurrentPage = 0;

  @override
  void initState() {
    super.initState();
    innerCarouselController = CarouselSliderController();
  }

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      carouselController: innerCarouselController,
      items: innerStyleImages.map((imagePath) {
        return CustomImageCarouselItem(
          imageUrl: imagePath,
        );
      }).toList(),
      options: CarouselOptions(
        autoPlay: true,
        enlargeCenterPage: true,
        enableInfiniteScroll: true,
        viewportFraction: 0.8,
        onPageChanged: (index, reason) {
          setState(() {});
        },
      ),
    );
  }
}
