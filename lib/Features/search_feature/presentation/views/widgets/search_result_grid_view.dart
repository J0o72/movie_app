import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/Features/home_feature/presentation/widgets/custom_circular_loading.dart';
import 'package:movie_app/Features/search_feature/presentation/manager/cubits/cubit/search_cubit.dart';
import 'package:movie_app/Features/search_feature/presentation/views/widgets/custom_search_image.dart';
import 'package:movie_app/core/widgets/custom_error_failure.dart';

class SearchResultGridView extends StatelessWidget {
  const SearchResultGridView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchCubit, SearchState>(
      builder: (context, state) {
        if (state is SearchSuccess) {
          return GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
              childAspectRatio: 1.5 / 2,
            ),
            itemCount: 30,
            itemBuilder: (context, index) {
              return const CustomSearchImage();
            },
          );
        } else if (state is SearchFailure) {
          return const CustomErrorFailure();
        } else if (state is SearchLoading) {
          return const CustomCircularLoading();
        } else {
          return Container();
        }
      },
    );
  }
}
