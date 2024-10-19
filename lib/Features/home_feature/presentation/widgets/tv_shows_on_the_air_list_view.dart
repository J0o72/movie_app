import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/Features/home_feature/presentation/manager/tv_shows_cubits/on_the_air_tv_shows_cubit/on_the_air_tv_shows_cubit.dart';
import 'package:movie_app/Features/home_feature/presentation/widgets/now_playing_item.dart';
import 'package:movie_app/Features/home_feature/presentation/widgets/now_playing_list_view.dart';
import 'package:movie_app/core/widgets/custom_error_failure.dart';

class OnTheAirListView extends StatelessWidget {
  const OnTheAirListView({super.key, this.horizontalPadding = 20});

  final double horizontalPadding;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OnTheAirTvShowsCubit, OnTheAirTvShowsState>(
      builder: (context, state) {
        if (state is OnTheAirTvShowsSuccess) {
          return SizedBox(
            height: 300,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: state.onTheAirTVShows.length,
                itemBuilder: (context, index) {
                  return NowPlayingItem(
                    tvShowsModel: state.onTheAirTVShows[index],
                  );
                },
              ),
            ),
          );
        } else if (state is OnTheAirTvShowsFailure) {
          return const CustomErrorFailure();
        } else {
          return const ListViewSkeletonizer();
        }
      },
    );
  }
}
