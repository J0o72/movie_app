import 'package:flutter/material.dart';
import 'package:movie_app/Features/home_feature/presentation/widgets/save_view_body.dart';

class SavedView extends StatelessWidget {
  const SavedView({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: SavedViewBody(),
    );
  }
}
