import 'package:flutter/material.dart';
import 'package:movie_app/Features/home_feature/data/models/details_model/details_view_navigator_model.dart';
import 'package:movie_app/Features/home_feature/presentation/widgets/genre_view_body.dart';

class GenreView extends StatelessWidget {
  const GenreView({super.key, required this.detailsViewNavigatorModel});
  final DetailsViewNavigatorModel detailsViewNavigatorModel;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GenreViewBody(
        id: detailsViewNavigatorModel.id,
        fromWhere: detailsViewNavigatorModel.fromWhere,
      ),
    );
  }
}
