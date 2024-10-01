import 'package:flutter/material.dart';
import 'package:movie_app/Features/home_feature/presentation/widgets/custom_back_arrow_icon.dart';
import 'package:movie_app/Features/home_feature/presentation/widgets/custom_bookmark_icon.dart';
import 'package:movie_app/Features/home_feature/presentation/widgets/details_custom_poster.dart';
import 'package:movie_app/Features/home_feature/presentation/widgets/details_view_body_information.dart';

class DetailsViewBody extends StatelessWidget {
  const DetailsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: DetailsViewBodyContent(),
    );
  }
}

class DetailsViewBodyContent extends StatelessWidget {
  const DetailsViewBodyContent({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Column(
            children: [
              Stack(
                children: [
                  DetailsCustomPoster(),
                  CustomBookmarkIcon(
                    rightPos: 20,
                    topPos: 40,
                  ),
                  CustomBackArrowIcon(),
                ],
              ),
              DetailsViewBodyInformation(),
            ],
          ),
        ),
      ],
    );
  }
}
