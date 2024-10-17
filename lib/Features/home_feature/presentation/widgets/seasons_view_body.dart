import 'package:flutter/material.dart';
import 'package:movie_app/Features/home_feature/presentation/widgets/seasons_grid_view.dart';
import 'package:movie_app/core/utils/styles.dart';

class SeasonsViewBody extends StatelessWidget {
  const SeasonsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Seasons',
          style: Styles.styleText28.copyWith(color: Colors.red),
        ),
        centerTitle: true,
        automaticallyImplyLeading: false,
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: const SeasonsGridView(),
    );
  }
}
