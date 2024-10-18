import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/Features/search_feature/presentation/manager/cubits/cubit/search_cubit.dart';
import 'package:movie_app/Features/search_feature/presentation/views/widgets/custom_search_image.dart';
import 'package:movie_app/core/utils/styles.dart';
import 'package:movie_app/core/widgets/custom_error_failure.dart';
import 'package:skeletonizer/skeletonizer.dart';

class SearchResultGridView extends StatelessWidget {
  const SearchResultGridView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchCubit, SearchState>(
      builder: (context, state) {
        if (state is SearchSuccess) {
          if (state.searchResult.isNotEmpty) {
            return GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                childAspectRatio: 1.3 / 2,
              ),
              itemCount: state.searchResult.length,
              itemBuilder: (context, index) {
                return CustomSearchImage(
                  searchResultsModel: state.searchResult[index],
                );
              },
            );
          } else {
            return const Center(
              child: Text(
                'No Data Found',
                style: Styles.styleText20,
              ),
            );
          }
        } else if (state is SearchFailure) {
          return const CustomErrorFailure();
        } else if (state is SearchLoading) {
          return const SearchResultGridViewSkeletonizer();
        } else {
          return const Center(
            child: Text(
              'No Data Found Yet, Search First',
              style: Styles.styleText20,
            ),
          );
        }
      },
    );
  }
}

class SearchResultGridViewSkeletonizer extends StatelessWidget {
  const SearchResultGridViewSkeletonizer({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.only(left: 15),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        childAspectRatio: 1.4 / 2,
      ),
      itemBuilder: (context, index) {
        return Skeletonizer(
          enabled: true,
          child: SizedBox(
            height: MediaQuery.of(context).size.height * 0.25,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: AspectRatio(
                  aspectRatio: 2.8 / 3.5,
                  child: Image.asset(
                    'assets/images/movie_welcome_screen_bg.jpg',
                    fit: BoxFit.cover,
                  )),
            ),
          ),
        );
      },
    );
  }
}
