import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/Features/categories_feature/presentation/manager/category_cubit/category_cubit.dart';
import 'package:movie_app/Features/categories_feature/presentation/views/widgets/category_results_image.dart';
import 'package:movie_app/Features/home_feature/presentation/widgets/movie_collection_Grid_view.dart';
import 'package:movie_app/core/utils/collection_model.dart';
import 'package:movie_app/core/widgets/custom_error_failure.dart';

class CategoryResultsGridView extends StatefulWidget {
  const CategoryResultsGridView({super.key, required this.collectionModel});

  final CollectionModel collectionModel;

  @override
  State<CategoryResultsGridView> createState() =>
      _CategoryResultsGridViewState();
}

class _CategoryResultsGridViewState extends State<CategoryResultsGridView> {
  @override
  void initState() {
    super.initState();

    if (widget.collectionModel.collectionTitle == 'Arabic' ||
        widget.collectionModel.collectionTitle == 'Turky' ||
        widget.collectionModel.collectionTitle == 'English' ||
        widget.collectionModel.collectionTitle == 'Spain' ||
        widget.collectionModel.collectionTitle == 'Chine' ||
        widget.collectionModel.collectionTitle == 'Korean' ||
        widget.collectionModel.collectionTitle == 'Indian') {
      BlocProvider.of<CategoryCubit>(context).fetchCategoryByOriginalLanguage(
          originalLanguage: widget.collectionModel.id!);
    } else if (widget.collectionModel.collectionTitle == 'Marvel' ||
        widget.collectionModel.collectionTitle == 'Warner Bros' ||
        widget.collectionModel.collectionTitle == 'Lionsgate') {
      BlocProvider.of<CategoryCubit>(context)
          .fetchCategoryByCompany(company: widget.collectionModel.id!);
    } else {
      BlocProvider.of<CategoryCubit>(context)
          .fetchCategoryByNetwork(network: widget.collectionModel.id!);
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoryCubit, CategoryState>(
      builder: (context, state) {
        if (state is CategorySuccess) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio: 1.3 / 2,
              ),
              itemCount: state.categoryResults.length,
              itemBuilder: (context, index) {
                return CustomCategoryResultsImage(
                  categoryModel: state.categoryResults[index],
                );
              },
            ),
          );
        } else if (state is CategoryFailure) {
          return const CustomErrorFailure();
        } else {
          return const MovieCollectionGridViewSkeletonizer();
        }
      },
    );
  }
}
