import 'package:flutter/material.dart';
import 'package:movie_app/Features/search_feature/presentation/views/widgets/search_view_body.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: SearchViewBody(),
    );
  }
}
