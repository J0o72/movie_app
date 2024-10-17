import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/Features/home_feature/data/repos/season_repo/season_repo_impl.dart';
import 'package:movie_app/Features/home_feature/presentation/manager/seasons_cubit/seasons_cubit.dart';
import 'package:movie_app/Features/home_feature/presentation/widgets/seasons_grid_view.dart';
import 'package:movie_app/core/utils/service_locator.dart';
import 'package:movie_app/core/utils/styles.dart';

class SeasonsViewBody extends StatelessWidget {
  const SeasonsViewBody({super.key, required this.seasonId});
  final int seasonId;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          SeasonsCubit(getIt.get<SeasonRepoImpl>())..fetchSeasons(id: seasonId),
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Seasons',
            style: Styles.styleText28.copyWith(color: Colors.red),
          ),
          centerTitle: true,
          automaticallyImplyLeading: false,
          elevation: 0,
          backgroundColor: Colors.transparent,
        ),
        body: const SeasonsGridView(),
      ),
    );
  }
}
