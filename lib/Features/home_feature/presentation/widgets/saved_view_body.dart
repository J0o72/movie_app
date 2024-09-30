import 'package:flutter/material.dart';
import 'package:movie_app/Features/home_feature/presentation/widgets/saved_list_view.dart';

import 'package:movie_app/Features/home_feature/presentation/widgets/saved_view_item.dart';

import 'package:movie_app/core/utils/styles.dart';

class SavedViewBody extends StatelessWidget {
  const SavedViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const SavedListView(),
      appBar: AppBar(
        title: const Text(
          "Saved",
          style: Styles.styleText22,
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: false,
      ),
    );
  }
}
