import 'package:flutter/material.dart';
import 'package:movie_app/Features/home_feature/presentation/widgets/saved_view_item.dart';

class SavedListView extends StatelessWidget {
  const SavedListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 4,
      itemBuilder: (context, index) {
        return const SavedViewItem();
      },
    );
  }
}
