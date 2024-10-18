import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/Features/home_feature/presentation/manager/seasons_cubit/seasons_cubit.dart';
import 'package:movie_app/Features/home_feature/presentation/widgets/season_custom_image.dart';
import 'package:movie_app/core/widgets/custom_error_failure.dart';
import 'package:skeletonizer/skeletonizer.dart';

class SeasonsGridView extends StatelessWidget {
  const SeasonsGridView({super.key, required this.seriesId});
  final num seriesId;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SeasonsCubit, SeasonsState>(
      builder: (context, state) {
        if (state is SeasonsSuccess) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio: 1.3 / 2,
              ),
              itemCount: state.seasons.length,
              itemBuilder: (context, index) {
                return SeasonsCutomImage(
                  seasonModel: state.seasons[index],
                  seriesId: seriesId,
                );
              },
            ),
          );
        } else if (state is SeasonsFailure) {
          return const CustomErrorFailure();
        } else {
          return const SeasonsGridViewSkeletonizer();
        }
      },
    );
  }
}

class SeasonsGridViewSkeletonizer extends StatelessWidget {
  const SeasonsGridViewSkeletonizer({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.only(left: 15),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        childAspectRatio: 1.4 / 2,
      ),
      itemBuilder: (context, index) {
        return Skeletonizer(
          enabled: true,
          child: SizedBox(
            height: MediaQuery.of(context).size.height * 0.25,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: AspectRatio(
                  aspectRatio: 2.8 / 3.5,
                  child: Image.asset(
                    'assets/images/movie_welcome_screen_bg.jpg',
                    fit: BoxFit.cover,
                  )),
            ),
          ),
        );
      },
    );
  }
}
