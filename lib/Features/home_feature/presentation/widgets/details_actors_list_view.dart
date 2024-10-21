import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/Features/home_feature/presentation/manager/cast_cubit/cast_cubit.dart';
import 'package:movie_app/Features/home_feature/presentation/widgets/Skeletonizer/details_cast_skeletonizer.dart';
import 'package:movie_app/Features/home_feature/presentation/widgets/details_actors_item.dart';
import 'package:movie_app/core/utils/styles.dart';
import 'package:movie_app/core/widgets/custom_error_failure.dart';

class ActorsListView extends StatelessWidget {
  const ActorsListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CastCubit, CastState>(
      builder: (context, state) {
        if (state is CastSuccess) {
          if (state.castsModel!.isNotEmpty) {
            return Padding(
              padding: const EdgeInsets.only(left: 15, top: 5),
              child: SizedBox(
                height: state.castsModel!.isNotEmpty ? 140 : 0,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: state.castsModel!.length,
                  itemBuilder: (context, index) {
                    return ActorsItem(
                      castsModel: state.castsModel![index],
                    );
                  },
                ),
              ),
            );
          } else {
            return const Center(
              child: Padding(
                padding: EdgeInsets.all(22),
                child: Text(
                  'Sorry ,No Cast For This',
                  style: Styles.styleText22,
                ),
              ),
            );
          }
        } else if (state is CastFailure) {
          return const CustomErrorFailure();
        } else {
          return const DetailsCastSkeletonizer();
        }
      },
    );
  }
}
