import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/Features/home_feature/data/repos/details_repo/details_repo_impl.dart';
import 'package:movie_app/Features/home_feature/presentation/manager/details_cubit/details_cubit.dart';
import 'package:movie_app/Features/home_feature/presentation/widgets/details_view_body_content.dart';
import 'package:movie_app/core/utils/service_locator.dart';

class DetailsViewBody extends StatelessWidget {
  const DetailsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => DetailsCubit(getIt.get<DetailsRepoImpl>()),
        child: const DetailsViewBodyContent(),
      ),
    );
  }
}
