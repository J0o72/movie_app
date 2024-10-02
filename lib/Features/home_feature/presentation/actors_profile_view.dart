import 'package:flutter/material.dart';
import 'package:movie_app/Features/home_feature/presentation/widgets/actor_profile_view_body.dart';

class ActorProfileView extends StatelessWidget {
  const ActorProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: ActorProfileViewBody(),
    );
  }
}
