import 'package:flutter/material.dart';
import 'package:movie_app/Features/home_feature/presentation/widgets/genre_gird_view.dart';

class GenreViewBody extends StatelessWidget {
  const GenreViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: GenreGirdViewGenres(),
    );
  }
}
