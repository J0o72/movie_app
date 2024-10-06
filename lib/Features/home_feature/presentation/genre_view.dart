import 'package:flutter/material.dart';
import 'package:movie_app/Features/home_feature/presentation/widgets/genre_view_body.dart';

class GenreView extends StatelessWidget {
  const GenreView({super.key, required this.id});
  final int id;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GenreViewBody(
        id: id,
      ),
    );
  }
}
