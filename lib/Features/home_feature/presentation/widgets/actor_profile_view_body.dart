import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/Features/home_feature/data/repos/actor_repo/actor_repo_impl.dart';
import 'package:movie_app/Features/home_feature/presentation/manager/actor_profile_cubit/actor_profile_cubit.dart';
import 'package:movie_app/Features/home_feature/presentation/widgets/actor_profile_Information.dart';
import 'package:movie_app/Features/home_feature/presentation/widgets/actor_profile_background_image.dart';
import 'package:movie_app/Features/home_feature/presentation/widgets/custom_circular_loading.dart';
import 'package:movie_app/core/utils/service_locator.dart';
import 'package:movie_app/core/widgets/custom_error_failure.dart';

class ActorProfileViewBody extends StatefulWidget {
  const ActorProfileViewBody({super.key, required this.actorID});
  final int actorID;

  @override
  State<ActorProfileViewBody> createState() => _ActorProfileViewBodyState();
}

class _ActorProfileViewBodyState extends State<ActorProfileViewBody> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<ActorProfileCubit>(context)
        .fetchActorDetails(actorID: widget.actorID);
    BlocProvider.of<ActorProfileCubit>(context)
        .fetchActorSocialMedia(actorID: widget.actorID);
    BlocProvider.of<ActorProfileCubit>(context)
        .fetchActorCredits(actorID: widget.actorID.toString());
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ActorProfileCubit(getIt.get<ActorRepoImpl>()),
      child: Scaffold(
        body: BlocBuilder<ActorProfileCubit, ActorProfileState>(
          builder: (context, state) {
            if (state is ActorProfileSuccess) {
              return Stack(
                children: [
                  ActorProfileBackgroundImage(
                    actorDetails: state.actorDetails!,
                  ),
                  ActorProfileInformation(
                    actorCredits: state.actorCredits!,
                    actorDetails: state.actorDetails!,
                    actorSocialMedia: state.actorSocialMedia!,
                  ),
                ],
              );
            } else if (state is ActorProfileFailure) {
              return const CustomErrorFailure();
            } else {
              return const CustomCircularLoading();
            }
          },
        ),
      ),
    );
  }
}
