import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/Features/home_feature/data/repos/details_repo/details_repo_impl.dart';
import 'package:movie_app/Features/home_feature/presentation/manager/reviews_cubit/reviews_cubit.dart';
import 'package:movie_app/Features/home_feature/presentation/widgets/review_list_view.dart';
import 'package:movie_app/core/utils/service_locator.dart';
import 'package:movie_app/core/utils/styles.dart';

class ReviewViewBody extends StatelessWidget {
  const ReviewViewBody({super.key, required this.fromWhere, required this.id});
  final String fromWhere;
  final int id;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ReviewsCubit(getIt.get<DetailsRepoImpl>()),
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "Reviews",
            style: Styles.styleText28.copyWith(color: Colors.red),
          ),
          centerTitle: true,
          automaticallyImplyLeading: false,
          elevation: 0,
          backgroundColor: Colors.transparent,
        ),
        body: ReviewListView(
          fromWhere: fromWhere,
          id: id,
        ),
      ),
    );
  }
}
