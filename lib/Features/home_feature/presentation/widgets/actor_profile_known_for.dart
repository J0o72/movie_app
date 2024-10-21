import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/Features/home_feature/presentation/manager/actor_known_for_cubit/actor_known_for_cubit.dart';
import 'package:movie_app/Features/home_feature/presentation/widgets/Skeletonizer/list_view_skeletonizer.dart';
import 'package:movie_app/Features/home_feature/presentation/widgets/now_playing_item.dart';
import 'package:movie_app/core/widgets/custom_error_failure.dart';

class ActorProfileKnownFor extends StatelessWidget {
  const ActorProfileKnownFor({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ActorKnownForCubit, ActorKnownForState>(
      builder: (context, state) {
        if (state is ActorKnownForSuccess) {
          return SizedBox(
            height: 300,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: state.actorCredits.length,
                itemBuilder: (context, index) {
                  return NowPlayingItem(
                    actorCredits: state.actorCredits[index],
                  );
                },
              ),
            ),
          );
        } else if (state is ActorKnownForFailure) {
          return const CustomErrorFailure();
        } else {
          return const ListViewSkeletonizer();
        }
      },
    );
  }
}
