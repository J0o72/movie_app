import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/Features/home_feature/presentation/manager/actor_known_for_cubit/actor_known_for_cubit.dart';
import 'package:movie_app/Features/home_feature/presentation/manager/actor_profile_cubit/actor_profile_cubit.dart';
import 'package:movie_app/Features/home_feature/presentation/manager/actor_social_media_cubit/actor_social_media_cubit.dart';
import 'package:movie_app/Features/home_feature/presentation/widgets/actor_profile_Information.dart';
import 'package:movie_app/Features/home_feature/presentation/widgets/actor_profile_background_image.dart';
import 'package:movie_app/core/widgets/custom_error_failure.dart';
import 'package:movie_app/core/widgets/loading.dart';

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
    BlocProvider.of<ActorSocialMediaCubit>(context)
        .fetchActorSocialMedia(actorID: widget.actorID);
    BlocProvider.of<ActorKnownForCubit>(context)
        .fetchActorCredits(actorID: widget.actorID.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<ActorProfileCubit, ActorProfileState>(
        builder: (context, state) {
          if (state is ActorProfileSuccess) {
            return Stack(
              children: [
                ActorProfileBackgroundImage(
                  actorDetails: state.actorDetails!,
                ),
                ActorProfileInformation(
                  actorDetails: state.actorDetails!,
                ),
              ],
            );
          } else if (state is ActorProfileFailure) {
            return const CustomErrorFailure();
          } else {
            return const Loading();
          }
        },
      ),
    );
  }
}
