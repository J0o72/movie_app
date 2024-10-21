import 'package:flutter/material.dart';
import 'package:movie_app/core/utils/styles.dart';
import 'package:skeletonizer/skeletonizer.dart';

class DetailsReviewsSkeletonizer extends StatelessWidget {
  const DetailsReviewsSkeletonizer({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250,
      child: ListView.builder(
        padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 10),
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: 2,
        itemBuilder: (context, index) {
          return Skeletonizer(
            enabled: true,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    // color: Colors.white,
                  ),
                  width: 70,
                  height: 70,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(50),
                    child: Image.asset(
                      'assets/images/movie_welcome_screen_bg.jpg',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'youssef abdallah',
                        style: Styles.styleText20,
                      ),
                      const SizedBox(
                        height: 3,
                      ),
                      const Text(
                        'youssef abdallah youssef abdallah youssef abdallah youssef abdallah youssef abdallah youssef abdallah youssef abdallah youssef abdallah',
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(
                        height: 3,
                      ),
                      Row(
                        children: [
                          const Text('9.9 / 10'),
                          const Spacer(),
                          Padding(
                            padding: const EdgeInsets.only(
                              right: 15,
                            ),
                            child: Text(
                              '2024-10-12',
                              style: Styles.styleText16.copyWith(
                                  color: Colors.white.withOpacity(0.5)),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
