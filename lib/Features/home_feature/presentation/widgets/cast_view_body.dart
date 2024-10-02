import 'package:flutter/material.dart';
import 'package:movie_app/Features/home_feature/presentation/widgets/details_actors_item.dart';

class CastViewBody extends StatelessWidget {
  const CastViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: CastGridView(),
    );
  }
}

class CastGridView extends StatelessWidget {
  const CastGridView({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 8,
        crossAxisSpacing: 8,
      ),
      itemCount: 6,
      itemBuilder: (context, index) {
        return const ActorsItem();
      },
    );
  }
}
