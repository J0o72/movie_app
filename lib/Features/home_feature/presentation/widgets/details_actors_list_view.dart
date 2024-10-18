import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/Features/home_feature/presentation/manager/cast_cubit/cast_cubit.dart';
import 'package:movie_app/Features/home_feature/presentation/widgets/details_actors_item.dart';
import 'package:movie_app/core/utils/styles.dart';
import 'package:movie_app/core/widgets/custom_error_failure.dart';
import 'package:skeletonizer/skeletonizer.dart';

class ActorsListView extends StatelessWidget {
  const ActorsListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CastCubit, CastState>(
      builder: (context, state) {
        if (state is CastSuccess) {
          return Padding(
            padding: const EdgeInsets.only(left: 15, top: 5),
            child: SizedBox(
              height: state.castsModel!.isNotEmpty ? 140 : 0,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: state.castsModel!.length,
                itemBuilder: (context, index) {
                  if (state.castsModel!.isNotEmpty) {
                    return ActorsItem(
                      castsModel: state.castsModel![index],
                    );
                  } else {
                    return const Center(
                      child: Text(
                        'Sorry ,No Reviews For This',
                        style: Styles.styleText18,
                      ),
                    );
                  }
                },
              ),
            ),
          );
        } else if (state is CastFailure) {
          return const CustomErrorFailure();
        } else {
          return const DetailsCastSkeletonizer();
        }
      },
    );
  }
}

class DetailsCastSkeletonizer extends StatelessWidget {
  const DetailsCastSkeletonizer({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 140,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 5,
        itemBuilder: (context, index) {
          return Skeletonizer(
            enabled: true,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: SizedBox(
                width: 100,
                child: Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                      ),
                      width: 100,
                      height: 100,
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(50),
                          child: Image.asset(
                            'assets/images/movie_welcome_screen_bg.jpg',
                            fit: BoxFit.cover,
                          )),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Center(
                      child: Text(
                        'Youssef abdallah',
                        textAlign: TextAlign.center,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: Styles.styleText16.copyWith(
                          height: 1,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
