import 'package:flutter/material.dart';
import 'package:movie_app/Features/home_feature/presentation/widgets/actor_profile_view_body.dart';

class ActorProfileView extends StatelessWidget {
  const ActorProfileView({super.key, required this.actorID});
  final int actorID;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ActorProfileViewBody(
        actorID: actorID,
      ),
    );
  }
}
