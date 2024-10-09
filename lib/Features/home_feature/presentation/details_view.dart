import 'package:flutter/material.dart';
import 'package:movie_app/Features/home_feature/data/models/details_model/details_view_navigator_model.dart';
import 'package:movie_app/Features/home_feature/presentation/widgets/details_view_body.dart';

class DetailsView extends StatelessWidget {
  const DetailsView({super.key, required this.detailsViewNavigatorModel});
  final DetailsViewNavigatorModel detailsViewNavigatorModel;

  @override
  Widget build(BuildContext context) {
    return DetailsViewBody(
      fromWhere: detailsViewNavigatorModel.fromWhere,
      id: detailsViewNavigatorModel.id,
    );
  }
}
