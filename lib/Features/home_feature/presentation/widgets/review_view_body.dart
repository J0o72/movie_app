import 'package:flutter/material.dart';
import 'package:movie_app/Features/home_feature/presentation/widgets/review_list_view.dart';
import 'package:movie_app/core/utils/styles.dart';

class ReviewViewBody extends StatelessWidget {
  const ReviewViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Reviews",
          style: Styles.styleText28.copyWith(color: Colors.red),
        ),
        centerTitle: true,
        automaticallyImplyLeading: false,
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: const ReviewListView(),
    );
  }
}
