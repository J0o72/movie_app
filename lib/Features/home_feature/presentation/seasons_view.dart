import 'package:flutter/material.dart';
import 'package:movie_app/Features/home_feature/presentation/widgets/seasons_view_body.dart';

class SeasonsView extends StatelessWidget {
  const SeasonsView({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: SeasonsViewBody(),
    );
  }
}
