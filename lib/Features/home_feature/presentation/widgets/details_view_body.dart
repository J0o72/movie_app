import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/Features/home_feature/data/repos/details_repo/details_repo_impl.dart';
import 'package:movie_app/Features/home_feature/data/repos/saved_repo/saved_repo_impl.dart';
import 'package:movie_app/Features/home_feature/presentation/manager/cast_cubit/cast_cubit.dart';
import 'package:movie_app/Features/home_feature/presentation/manager/cubit/trailler_cubit.dart';
import 'package:movie_app/Features/home_feature/presentation/manager/details_cubit/details_cubit.dart';
import 'package:movie_app/Features/home_feature/presentation/manager/reviews_cubit/reviews_cubit.dart';
import 'package:movie_app/Features/home_feature/presentation/manager/save_to_fav_cubit/save_to_fav_cubit.dart';
import 'package:movie_app/Features/home_feature/presentation/manager/saved_cubit/saved_cubit.dart';
import 'package:movie_app/Features/home_feature/presentation/manager/similar_cubit/similar_cubit.dart';
import 'package:movie_app/Features/home_feature/presentation/widgets/details_view_body_content.dart';
import 'package:movie_app/core/utils/service_locator.dart';

class DetailsViewBody extends StatelessWidget {
  const DetailsViewBody({super.key, required this.fromWhere, required this.id});
  final String fromWhere;
  final int id;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => DetailsCubit(getIt.get<DetailsRepoImpl>()),
        ),
        BlocProvider(
          create: (context) => CastCubit(getIt.get<DetailsRepoImpl>()),
        ),
        BlocProvider(
          create: (context) => ReviewsCubit(getIt.get<DetailsRepoImpl>()),
        ),
        BlocProvider(
          create: (context) => SimilarCubit(getIt.get<DetailsRepoImpl>()),
        ),
        BlocProvider(
          create: (context) => SaveToFavCubit(getIt.get<SavedRepoImpl>()),
        ),
        BlocProvider(
          create: (context) => SavedCubit(getIt.get<SavedRepoImpl>()),
        ),
        BlocProvider(
          create: (context) => TraillerCubit(getIt.get<DetailsRepoImpl>()),
        ),
      ],
      child: Scaffold(
        body: DetailsViewBodyContent(
          fromWhere: fromWhere,
          id: id,
        ),
      ),
    );
  }
}
