import 'package:flutter/material.dart';
import 'package:movie_app/Features/home_feature/presentation/widgets/movie_collection_view_body.dart';
import 'package:movie_app/core/utils/collection_model.dart';

class MovieCollecionView extends StatelessWidget {
  const MovieCollecionView({super.key, required this.collectionModel});

  final CollectionModel collectionModel;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: MovieCollecionViewBody(
        fromWhere: collectionModel.collectionName,
        title: collectionModel.collectionTitle,
      ),
    );
  }
}
