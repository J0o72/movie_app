import 'package:flutter/material.dart';
import 'package:movie_app/Features/home_feature/presentation/widgets/details_actors_item.dart';

class ActorsListView extends StatelessWidget {
  const ActorsListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15, top: 5),
      child: SizedBox(
        height: 140,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 5,
          itemBuilder: (context, index) {
            return const ActorsItem();
          },
        ),
      ),
    );
  }
}
