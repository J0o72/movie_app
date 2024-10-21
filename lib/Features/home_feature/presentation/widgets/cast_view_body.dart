import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/Features/home_feature/data/repos/details_repo/details_repo_impl.dart';
import 'package:movie_app/Features/home_feature/presentation/manager/cast_cubit/cast_cubit.dart';
import 'package:movie_app/Features/home_feature/presentation/widgets/cast_grid_view.dart';
import 'package:movie_app/core/utils/service_locator.dart';
import 'package:movie_app/core/utils/styles.dart';

class CastViewBody extends StatelessWidget {
  const CastViewBody({super.key, required this.fromWhere, required this.id});
  final String fromWhere;
  final int id;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CastCubit(getIt.get<DetailsRepoImpl>()),
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "Casts",
            style: Styles.styleText28.copyWith(color: Colors.red),
          ),
          centerTitle: true,
          automaticallyImplyLeading: false,
          elevation: 0,
          backgroundColor: Colors.transparent,
        ),
        body: CastGridView(
          fromWhere: fromWhere,
          id: id,
        ),
      ),
    );
  }
}
