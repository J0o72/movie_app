import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/Features/home_feature/presentation/manager/details_cubit/details_cubit.dart';
import 'package:movie_app/Features/home_feature/presentation/manager/similar_cubit/similar_cubit.dart';
import 'package:movie_app/Features/home_feature/presentation/widgets/custom_circular_loading.dart';
import 'package:movie_app/Features/home_feature/presentation/widgets/now_playing_item.dart';
import 'package:movie_app/core/utils/styles.dart';
import 'package:movie_app/core/widgets/custom_error_failure.dart';

class DetailsSimilarListView extends StatelessWidget {
  const DetailsSimilarListView({super.key, required this.horizontalPadding});

  final double horizontalPadding;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SimilarCubit, SimilarState>(
      builder: (context, state) {
        if (state is SimilarSuccess) {
          if (state.similartMovies != null) {
            if (state.similartMovies!.isNotEmpty) {
              return SizedBox(
                height: state.similartMovies!.isNotEmpty ? 300 : 0,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: state.similartMovies!.length,
                    itemBuilder: (context, index) {
                      return NowPlayingItem(
                        movieModel: state.similartMovies![index],
                      );
                    },
                  ),
                ),
              );
            } else {
              return const Padding(
                padding: EdgeInsets.all(22),
                child: Center(
                    child: Text(
                  'Sorry, No More Like This',
                  style: Styles.styleText20,
                )),
              );
            }
          } else {
            if (state.similartTv!.isNotEmpty) {
              return SizedBox(
                height: state.similartTv!.isNotEmpty ? 300 : 0,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: state.similartTv!.length,
                    itemBuilder: (context, index) {
                      return NowPlayingItem(
                        tvShowsModel: state.similartTv![index],
                      );
                    },
                  ),
                ),
              );
            } else {
              return const Padding(
                padding: EdgeInsets.all(22),
                child: Center(
                    child: Text(
                  'Sorry, No More Like This',
                  style: Styles.styleText20,
                )),
              );
            }
          }
        } else if (state is DetailsFailure) {
          return const CustomErrorFailure();
        } else {
          return const CustomCircularLoading();
        }
      },
    );
  }
}
