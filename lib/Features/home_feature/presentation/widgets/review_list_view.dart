import 'package:flutter/material.dart';
import 'package:movie_app/Features/home_feature/presentation/widgets/details_review_item.dart';

class ReviewListView extends StatelessWidget {
  const ReviewListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: ListView.builder(
        itemBuilder: (context, index) {
          return const DetailsReviewItem();
        },
      ),
    );
  }
}
