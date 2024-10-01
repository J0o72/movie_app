import 'package:flutter/material.dart';
import 'package:movie_app/Features/home_feature/presentation/widgets/details_review_item.dart';

class DetailsReviewListView extends StatelessWidget {
  const DetailsReviewListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 10),
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: 2,
      itemBuilder: (context, index) {
        return const DetailsReviewItem();
      },
    );
  }
}
