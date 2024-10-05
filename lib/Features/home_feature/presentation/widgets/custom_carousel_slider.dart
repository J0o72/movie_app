import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/Features/home_feature/data/models/movie_model/movie_model.dart';
import 'package:movie_app/Features/home_feature/presentation/widgets/carousel_slider_indicators.dart';
import 'package:movie_app/Features/home_feature/presentation/widgets/custom_image_carousel_item.dart';
import 'package:movie_app/Features/home_feature/presentation/widgets/custom_slider_arrows.dart';
import 'package:movie_app/constants.dart';

class CustomCarouselSliderView extends StatefulWidget {
  const CustomCarouselSliderView({super.key, required this.movieModel});
  final List<MovieModel> movieModel;

  @override
  State<CustomCarouselSliderView> createState() =>
      _CustomCarouselSliderViewState();
}

class _CustomCarouselSliderViewState extends State<CustomCarouselSliderView>
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
    return Stack(
      alignment: Alignment.center,
      children: [
        CarouselSlider(
          carouselController: innerCarouselController,
          // items: innerStyleImages.map((imagePath) {
          //   return CustomImageCarouselItem(
          //     imageUrl: imagePath,
          //     movie: widget.movieModel,
          //   );
          // }).toList(),
          items: widget.movieModel.map((e) {
            return CustomImageCarouselItem(movie: e);
          }).toList(),
          options: CarouselOptions(
            autoPlay: true,
            enlargeCenterPage: true,
            enableInfiniteScroll: true,
            viewportFraction: 0.8,
            onPageChanged: (index, reason) {
              setState(() {
                innerCurrentPage = index;
              });
            },
          ),
        ),
        CustomCarouselIndicators(
          innerCurrentPage: innerCurrentPage,
          innerCarouselController: innerCarouselController,
        ),
        CarouselSliderArrow(
          innerCurrentPage: innerCurrentPage,
          innerCarouselController: innerCarouselController,
          icon: Icons.arrow_back,
          positionFromLeft: 11,
          onPressed: () {
            innerCarouselController.animateToPage(innerCurrentPage - 1);
          },
        ),
        CarouselSliderArrow(
          innerCurrentPage: innerCurrentPage,
          innerCarouselController: innerCarouselController,
          icon: Icons.arrow_forward,
          positionFromLeft: 340,
          onPressed: () {
            innerCarouselController.animateToPage(innerCurrentPage + 1);
          },
        ),
      ],
    );
  }
}
