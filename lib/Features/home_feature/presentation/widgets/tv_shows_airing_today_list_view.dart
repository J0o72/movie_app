import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/Features/home_feature/presentation/manager/tv_shows_cubits/airing_today_tv_shows_cubit/airing_today_tv_shows_cubit.dart';
import 'package:movie_app/Features/home_feature/presentation/widgets/now_playing_item.dart';
import 'package:movie_app/Features/home_feature/presentation/widgets/now_playing_list_view.dart';
import 'package:movie_app/core/widgets/custom_error_failure.dart';

class AiringTodayListView extends StatelessWidget {
  const AiringTodayListView({super.key, this.horizontalPadding = 20});

  final double horizontalPadding;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AiringTodayTvShowsCubit, AiringTodayTvShowsState>(
      builder: (context, state) {
        if (state is AiringTodayTvShowsSuccess) {
          return SizedBox(
            height: 300,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: state.airingTodayTVShows.length,
                itemBuilder: (context, index) {
                  return NowPlayingItem(
                    tvShowsModel: state.airingTodayTVShows[index],
                  );
                },
              ),
            ),
          );
        } else if (state is AiringTodayTvShowsFailure) {
          return const CustomErrorFailure();
        } else {
          return const ListViewSkeletonizer();
        }
      },
    );
  }
}
