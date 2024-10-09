import 'package:flutter/material.dart';
import 'package:movie_app/Features/home_feature/presentation/widgets/details_view_body.dart';

class DetailsView extends StatelessWidget {
  const DetailsView({super.key, required this.fromWhere, required this.id});
  final String fromWhere;
  final int id;

  @override
  Widget build(BuildContext context) {
    return DetailsViewBody(
      fromWhere: fromWhere,
      id: id,
    );
  }
}
