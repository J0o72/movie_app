import 'package:carousel_slider/carousel_controller.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/constants.dart';

class CustomCarouselIndicators extends StatelessWidget {
  const CustomCarouselIndicators({
    super.key,
    required this.innerCurrentPage,
    required this.innerCarouselController,
  });

  final int innerCurrentPage;
  final CarouselSliderController innerCarouselController;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 10,
      child: Row(
        children: List.generate(innerStyleImages.length, (index) {
          bool isSelected = innerCurrentPage == index;
          return GestureDetector(
            onTap: () {
              innerCarouselController.animateToPage(index);
            },
            child: AnimatedContainer(
              width: isSelected ? 55 : 17,
              height: 10,
              margin: EdgeInsets.symmetric(horizontal: isSelected ? 6 : 3),
              duration: const Duration(milliseconds: 300),
              curve: Curves.ease,
              decoration: BoxDecoration(
                color: isSelected ? kMainColor : Colors.grey.shade200,
                borderRadius: BorderRadius.circular(40),
              ),
            ),
          );
        }),
      ),
    );
  }
}
