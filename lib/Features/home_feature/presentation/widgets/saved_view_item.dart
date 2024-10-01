import 'package:flutter/material.dart';
import 'package:movie_app/Features/home_feature/presentation/widgets/saved_view_item_content.dart';

class SavedViewItem extends StatelessWidget {
  const SavedViewItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Container(
        width: MediaQuery.of(context).size.width * 0.9,
        height: 150,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: const Color(0xff7c889f),
        ),
        child: const SavedViewItemContent(),
      ),
    );
  }
}