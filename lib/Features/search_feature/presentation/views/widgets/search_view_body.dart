import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/Features/search_feature/data/repos/search_repo_impl.dart';
import 'package:movie_app/Features/search_feature/presentation/manager/cubits/cubit/search_cubit.dart';
import 'package:movie_app/Features/search_feature/presentation/views/widgets/custom_search_text_field.dart';
import 'package:movie_app/Features/search_feature/presentation/views/widgets/search_result_grid_view.dart';
import 'package:movie_app/core/utils/service_locator.dart';
import 'package:movie_app/core/utils/styles.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SearchCubit(getIt.get<SearchRepoImpl>()),
      child: const Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 20,
        ),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: 16),
              child: CustomSearchTextField(),
            ),
            SizedBox(
              height: 10,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Search Results:",
                style: Styles.styleText20,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Expanded(
              child: SearchResultGridView(),
            ),
          ],
        ),
      ),
    );
  }
}
