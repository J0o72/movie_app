import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/Features/home_feature/presentation/manager/reviews_cubit/reviews_cubit.dart';
import 'package:movie_app/Features/home_feature/presentation/widgets/custom_circular_loading.dart';
import 'package:movie_app/Features/home_feature/presentation/widgets/details_review_item.dart';
import 'package:movie_app/core/utils/styles.dart';
import 'package:movie_app/core/widgets/custom_error_failure.dart';

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
          return const CustomCircularLoading();
        }
      },
    );
  }
}
