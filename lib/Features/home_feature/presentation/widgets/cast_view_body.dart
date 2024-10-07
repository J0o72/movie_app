import 'package:flutter/material.dart';
import 'package:movie_app/Features/home_feature/presentation/widgets/details_actors_item.dart';
import 'package:movie_app/core/utils/styles.dart';

class CastViewBody extends StatelessWidget {
  const CastViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Casts",
          style: Styles.styleText28.copyWith(color: Colors.red),
        ),
        centerTitle: true,
        automaticallyImplyLeading: false,
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: const CastGridView(),
    );
  }
}

class CastGridView extends StatelessWidget {
  const CastGridView({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        mainAxisSpacing: 30,
        // crossAxisSpacing: 15,
      ),
      itemCount: 15,
      itemBuilder: (context, index) {
        // return const ActorsItem();
      },
    );
  }
}
