import 'package:flutter/material.dart';
import 'package:movie_app/core/utils/styles.dart';

class DetailsReviewerContent extends StatelessWidget {
  const DetailsReviewerContent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Chris Sawin",
            style: Styles.styleText20,
          ),
          const SizedBox(
            height: 3,
          ),
          const Text(
            "Such a fun watch, maybe one of the best experiences I've had in a theater. I couldn't have asked for a better ending to 24 year old franchise.",
            // maxLines: 3,
            // overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(
            height: 3,
          ),
          Row(
            children: [
              // const CustomRating(),
              const Spacer(),
              Padding(
                padding: const EdgeInsets.only(
                  right: 15,
                ),
                child: Text(
                  "2024-07-27",
                  style: Styles.styleText16
                      .copyWith(color: Colors.white.withOpacity(0.5)),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
