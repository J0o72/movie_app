import 'package:flutter/material.dart';
import 'package:movie_app/core/utils/styles.dart';

class SavedDismissibleBackground extends StatelessWidget {
  const SavedDismissibleBackground({
    super.key,
    required this.mainAxisAlignment,
  });

  final MainAxisAlignment mainAxisAlignment;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red, // Background color for dismiss action
      alignment: Alignment.centerRight, // Align icon to the right
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: mainAxisAlignment,
        children: const [
          Icon(
            Icons.delete,
            color: Colors.white,
            size: 32,
          ),
          SizedBox(
            width: 5,
          ),
          Text(
            'Delete',
            style: Styles.styleText22,
          )
        ],
      ),
    );
  }
}
