import 'package:flutter/material.dart';
import 'package:movie_app/Features/home_feature/presentation/widgets/movie_collection_Grid_view.dart';
import 'package:movie_app/core/utils/styles.dart';

class MovieCollecionViewBody extends StatelessWidget {
  const MovieCollecionViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Now Playing",
          style: Styles.styleText28.copyWith(color: Colors.red),
        ),
        centerTitle: true,
        automaticallyImplyLeading: false,
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: const MovieCollectionGridView(),
    );
  }
}
