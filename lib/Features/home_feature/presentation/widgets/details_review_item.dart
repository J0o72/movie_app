import 'package:flutter/material.dart';
import 'package:movie_app/Features/home_feature/presentation/widgets/details_custom_person_photo.dart';
import 'package:movie_app/Features/home_feature/presentation/widgets/details_reviewer_content.dart';

class DetailsReviewItem extends StatelessWidget {
  const DetailsReviewItem({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        DetailsCustomPersonPhoto(
          height: 70,
          width: 70,
        ),
        SizedBox(
          width: 10,
        ),
        DetailsReviewerContent(),
      ],
    );
  }
}
