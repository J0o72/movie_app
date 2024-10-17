import 'package:flutter/material.dart';
import 'package:movie_app/Features/home_feature/presentation/widgets/seasons_view_body.dart';

class SeasonsView extends StatelessWidget {
  const SeasonsView({super.key, required this.seasonId});
  final int seasonId;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SeasonsViewBody(
        seasonId: seasonId,
      ),
    );
  }
}
