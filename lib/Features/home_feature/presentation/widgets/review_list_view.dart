import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/Features/home_feature/presentation/manager/reviews_cubit/reviews_cubit.dart';
import 'package:movie_app/Features/home_feature/presentation/widgets/details_review_item.dart';
import 'package:movie_app/Features/home_feature/presentation/widgets/details_review_list_view.dart';
import 'package:movie_app/core/widgets/custom_error_failure.dart';

class ReviewListView extends StatefulWidget {
  const ReviewListView({super.key, required this.fromWhere, required this.id});
  final String fromWhere;
  final int id;

  @override
  State<ReviewListView> createState() => _ReviewListViewState();
}

class _ReviewListViewState extends State<ReviewListView> {
  @override
  void initState() {
    super.initState();
    if (widget.fromWhere == 'movie') {
      BlocProvider.of<ReviewsCubit>(context)
          .fetchReviewsList(id: widget.id, fromWhere: widget.fromWhere);
    } else if (widget.fromWhere == 'tv') {
      BlocProvider.of<ReviewsCubit>(context)
          .fetchReviewsList(id: widget.id, fromWhere: widget.fromWhere);
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ReviewsCubit, ReviewsState>(
      builder: (context, state) {
        if (state is ReviewsSuccess) {
          return Padding(
            padding: const EdgeInsets.all(10),
            child: ListView.builder(
              itemCount: state.review.length,
              itemBuilder: (context, index) {
                return DetailsReviewItem(
                  reviewsModel: state.review[index],
                );
              },
            ),
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
