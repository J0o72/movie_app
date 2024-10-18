import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/Features/home_feature/presentation/manager/reviews_cubit/reviews_cubit.dart';
import 'package:movie_app/Features/home_feature/presentation/widgets/details_review_item.dart';
import 'package:movie_app/core/utils/styles.dart';
import 'package:movie_app/core/widgets/custom_error_failure.dart';
import 'package:skeletonizer/skeletonizer.dart';

class DetailsReviewListView extends StatelessWidget {
  const DetailsReviewListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ReviewsCubit, ReviewsState>(
      builder: (context, state) {
        if (state is ReviewsSuccess) {
          return ListView.builder(
            padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 10),
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: state.review.length > 4 ? 4 : state.review.length,
            itemBuilder: (context, index) {
              if (state.review.isNotEmpty) {
                return DetailsReviewItem(
                  reviewsModel: state.review[index],
                );
              } else {
                return const Center(
                  child: Text(
                    'Sorry ,No Reviews For This',
                    style: Styles.styleText18,
                  ),
                );
              }
            },
          );
        } else if (state is ReviewsFailure) {
          return const CustomErrorFailure();
        } else {
          return const DetailsReviewsSkeletonizer();
        }
      },
    );
  }
}

class DetailsReviewsSkeletonizer extends StatelessWidget {
  const DetailsReviewsSkeletonizer({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
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
                            style: Styles.styleText16
                                .copyWith(color: Colors.white.withOpacity(0.5)),
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
    );
  }
}
