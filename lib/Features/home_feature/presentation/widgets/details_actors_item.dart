import 'package:flutter/material.dart';
import 'package:movie_app/Features/home_feature/presentation/widgets/details_custom_person_photo.dart';
import 'package:movie_app/core/utils/styles.dart';

class ActorsItem extends StatelessWidget {
  const ActorsItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 8),
      child: Column(
        children: [
          const DetailsCustomPersonPhoto(
            height: 100,
            width: 100,
          ),
          const SizedBox(
            height: 5,
          ),
          Center(
            child: Text(
              "Chris\nHemsworth",
              textAlign: TextAlign.center,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: Styles.styleText16.copyWith(height: 1),
            ),
          )
        ],
      ),
    );
  }
}
