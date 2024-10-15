import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/Features/home_feature/data/repos/saved_repo/saved_repo_impl.dart';
import 'package:movie_app/Features/home_feature/presentation/manager/save_to_fav_cubit/save_to_fav_cubit.dart';
import 'package:movie_app/Features/home_feature/presentation/manager/saved_cubit/saved_cubit.dart';
import 'package:movie_app/Features/home_feature/presentation/widgets/saved_list_view.dart';
import 'package:movie_app/core/utils/service_locator.dart';

import 'package:movie_app/core/utils/styles.dart';

class SavedViewBody extends StatelessWidget {
  const SavedViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              SavedCubit(getIt.get<SavedRepoImpl>())..fetchFavList(),
        ),
        BlocProvider(
          create: (context) => SaveToFavCubit(getIt.get<SavedRepoImpl>()),
        ),
      ],
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            "Saved",
            style: Styles.styleText22,
          ),
          centerTitle: true,
          elevation: 0,
          backgroundColor: Colors.transparent,
          automaticallyImplyLeading: false,
        ),
        body: const SavedListView(),
      ),
    );
  }
}
