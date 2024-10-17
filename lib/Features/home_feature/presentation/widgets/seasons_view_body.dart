import 'package:flutter/material.dart';
import 'package:movie_app/Features/home_feature/presentation/widgets/season_custom_image.dart';
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

class SeasonsGridView extends StatelessWidget {
  const SeasonsGridView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          childAspectRatio: 1.3 / 2,
        ),
        itemCount: 5,
        itemBuilder: (context, index) {
          return const SeasonsCutomImage();
        },
      ),
    );
  }
}
