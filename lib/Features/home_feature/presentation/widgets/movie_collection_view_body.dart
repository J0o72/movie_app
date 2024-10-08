import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/Features/home_feature/data/repos/collections_repo/collections_repo_impl.dart';
import 'package:movie_app/Features/home_feature/presentation/manager/collections_cubit/collections_cubit.dart';
import 'package:movie_app/Features/home_feature/presentation/widgets/movie_collection_Grid_view.dart';
import 'package:movie_app/core/utils/service_locator.dart';
import 'package:movie_app/core/utils/styles.dart';

class MovieCollecionViewBody extends StatelessWidget {
  const MovieCollecionViewBody(
      {super.key,
      required this.fromWhere,
      required this.title,
      required this.id});

  final String fromWhere, title;
  final String id;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CollectionsCubit(getIt.get<CollectionsRepoImpl>()),
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            title,
            style: Styles.styleText28.copyWith(color: Colors.red),
          ),
          centerTitle: true,
          automaticallyImplyLeading: false,
          elevation: 0,
          backgroundColor: Colors.transparent,
        ),
        body: MovieCollectionGridView(
          fromWhere: fromWhere,
          id: id,
        ),
      ),
    );
  }
}
