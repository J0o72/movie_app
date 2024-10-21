import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/Features/home_feature/presentation/manager/seasons_cubit/seasons_cubit.dart';
import 'package:movie_app/Features/home_feature/presentation/widgets/Skeletonizer/seasons_grid_view_skeletonizer.dart';
import 'package:movie_app/Features/home_feature/presentation/widgets/season_custom_image.dart';
import 'package:movie_app/core/widgets/custom_error_failure.dart';

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
