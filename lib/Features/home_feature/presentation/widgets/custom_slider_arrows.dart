import 'package:carousel_slider/carousel_controller.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/constants.dart';

class CarouselSliderArrow extends StatelessWidget {
  const CarouselSliderArrow(
      {super.key,
      required this.innerCurrentPage,
      required this.innerCarouselController,
      required this.icon,
      required this.positionFromLeft,
      required this.onPressed});

  final int innerCurrentPage;
  final CarouselSliderController innerCarouselController;
  final IconData icon;
  final double positionFromLeft;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: positionFromLeft,
      child: CircleAvatar(
        backgroundColor: kMainColor.withOpacity(0.6),
        child: IconButton(
          onPressed: onPressed,
          icon: Icon(
            icon,
            size: 20,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
