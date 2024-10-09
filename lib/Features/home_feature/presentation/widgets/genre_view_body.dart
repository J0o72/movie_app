import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/Features/home_feature/data/repos/genre_repo/genre_repo_impl.dart';
import 'package:movie_app/Features/home_feature/presentation/manager/genre_cubit/genre_cubit.dart';
import 'package:movie_app/Features/home_feature/presentation/widgets/genre_gird_view.dart';
import 'package:movie_app/core/utils/service_locator.dart';

class GenreViewBody extends StatelessWidget {
  const GenreViewBody({super.key, required this.id, required this.fromWhere});
  final int id;
  final String fromWhere;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GenreCubit(getIt.get<GenreRepoImpl>()),
      child: Scaffold(
        body: GenreGirdViewGenres(
          id: id,
          fromWhere: fromWhere,
        ),
      ),
    );
  }
}
