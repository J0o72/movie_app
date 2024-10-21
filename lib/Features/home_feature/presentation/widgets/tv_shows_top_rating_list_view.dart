import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/Features/home_feature/presentation/manager/tv_shows_cubits/top_rating_tv_shows_cubit/top_rating_tv_shows_cubit.dart';
import 'package:movie_app/Features/home_feature/presentation/widgets/Skeletonizer/list_view_skeletonizer.dart';
import 'package:movie_app/Features/home_feature/presentation/widgets/now_playing_item.dart';
import 'package:movie_app/core/widgets/custom_error_failure.dart';

class TopRatingTvShowsListView extends StatelessWidget {
  const TopRatingTvShowsListView({super.key, this.horizontalPadding = 20});

  final double horizontalPadding;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TopRatingTvShowsCubit, TopRatingTvShowsState>(
      builder: (context, state) {
        if (state is TopRatingTvShowsSuccess) {
          return SizedBox(
            height: 300,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: state.topRatingTVShows.length,
                itemBuilder: (context, index) {
                  return NowPlayingItem(
                    tvShowsModel: state.topRatingTVShows[index],
                  );
                },
              ),
            ),
          );
        } else if (state is TopRatingTvShowsFailure) {
          return const CustomErrorFailure();
        } else {
          return const ListViewSkeletonizer();
        }
      },
    );
  }
}
