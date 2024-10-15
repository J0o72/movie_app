import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/Features/home_feature/presentation/manager/saved_cubit/saved_cubit.dart';
import 'package:movie_app/Features/home_feature/presentation/widgets/custom_circular_loading.dart';
import 'package:movie_app/Features/home_feature/presentation/widgets/saved_view_item.dart';
import 'package:movie_app/core/widgets/custom_error_failure.dart';

class SavedListView extends StatelessWidget {
  const SavedListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SavedCubit, SavedState>(
      builder: (context, state) {
        if (state is SavedSuccess) {
          return ListView.builder(
            itemCount: state.favList.length,
            itemBuilder: (context, index) {
              return SavedViewItem(
                favItem: state.favList[index],
              );
            },
          );
        } else if (state is SavedFailure) {
          print(state.errorMessage);
          return const CustomErrorFailure();
        } else {
          return const CustomCircularLoading();
        }
      },
    );
  }
}
