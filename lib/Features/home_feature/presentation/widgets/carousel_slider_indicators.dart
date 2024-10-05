import 'package:carousel_slider/carousel_controller.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/constants.dart';

class CustomCarouselIndicators extends StatelessWidget {
  const CustomCarouselIndicators({
    super.key,
    required this.innerCurrentPage,
    required this.innerCarouselController,
    required this.moviesOrTVShows,
  });

  final int innerCurrentPage;
  final CarouselSliderController innerCarouselController;
  final List<dynamic> moviesOrTVShows;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 10,
      child: Row(
        children: List.generate(moviesOrTVShows.length, (index) {
          bool isSelected = innerCurrentPage == index;
          return GestureDetector(
            onTap: () {
              innerCarouselController.animateToPage(index);
            },
            child: AnimatedContainer(
              width: isSelected ? 20 : 10,
              height: 5,
              margin: EdgeInsets.symmetric(horizontal: isSelected ? 6 : 2),
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
