import 'package:flutter/material.dart';
import 'package:movie_app/Features/home_feature/data/models/details_model/details_view_navigator_model.dart';
import 'package:movie_app/Features/home_feature/presentation/widgets/cast_view_body.dart';

class CastView extends StatelessWidget {
  const CastView({super.key, required this.detailsViewNavigatorModel});
  final DetailsViewNavigatorModel detailsViewNavigatorModel;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: CastViewBody(
        fromWhere: detailsViewNavigatorModel.fromWhere,
        id: detailsViewNavigatorModel.id,
      ),
    );
  }
}
