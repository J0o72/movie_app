import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/Features/home_feature/data/repos/actor_repo/actor_repo_impl.dart';
import 'package:movie_app/Features/home_feature/presentation/manager/actor_known_for_cubit/actor_known_for_cubit.dart';
import 'package:movie_app/Features/home_feature/presentation/manager/actor_profile_cubit/actor_profile_cubit.dart';
import 'package:movie_app/Features/home_feature/presentation/manager/actor_social_media_cubit/actor_social_media_cubit.dart';
import 'package:movie_app/Features/home_feature/presentation/widgets/actor_profile_view_body.dart';
import 'package:movie_app/core/utils/service_locator.dart';

class ActorProfileView extends StatelessWidget {
  const ActorProfileView({super.key, required this.actorID});
  final int actorID;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ActorProfileCubit(getIt.get<ActorRepoImpl>()),
        ),
        BlocProvider(
          create: (context) => ActorKnownForCubit(getIt.get<ActorRepoImpl>()),
        ),
        BlocProvider(
          create: (context) =>
              ActorSocialMediaCubit(getIt.get<ActorRepoImpl>()),
        ),
      ],
      child: SafeArea(
        child: ActorProfileViewBody(
          actorID: actorID,
        ),
      ),
    );
  }
}
