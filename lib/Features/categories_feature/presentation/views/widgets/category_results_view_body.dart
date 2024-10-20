import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/Features/categories_feature/data/repos/category_repo_impl.dart';
import 'package:movie_app/Features/categories_feature/presentation/manager/category_cubit/category_cubit.dart';
import 'package:movie_app/Features/categories_feature/presentation/views/widgets/category_results_grid_view.dart';
import 'package:movie_app/core/utils/collection_model.dart';
import 'package:movie_app/core/utils/service_locator.dart';
import 'package:movie_app/core/utils/styles.dart';

class CategoryResultsViewBody extends StatelessWidget {
  const CategoryResultsViewBody({super.key, required this.collectionModel});

  final CollectionModel collectionModel;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CategoryCubit(getIt.get<CategoryRepoImpl>()),
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            collectionModel.collectionTitle,
            style: Styles.styleText28.copyWith(color: Colors.red),
          ),
          centerTitle: true,
          automaticallyImplyLeading: false,
          elevation: 0,
          backgroundColor: Colors.transparent,
        ),
        body: CategoryResultsGridView(
          collectionModel: collectionModel,
        ),
      ),
    );
  }
}
