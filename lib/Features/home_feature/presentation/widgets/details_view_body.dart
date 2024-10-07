import 'package:flutter/material.dart';
import 'package:movie_app/Features/home_feature/presentation/widgets/details_view_body_content.dart';

class DetailsViewBody extends StatelessWidget {
  const DetailsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: DetailsViewBodyContent(),
    );
  }
}
