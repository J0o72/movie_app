import 'package:flutter/material.dart';
import 'package:movie_app/Features/home_feature/data/models/details_model/details_model/details_model.dart';
import 'package:movie_app/core/utils/styles.dart';

class DetailsDurationTime extends StatelessWidget {
  const DetailsDurationTime({
    super.key,
    required this.detailsModel,
  });

  final DetailsModel detailsModel;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(
          Icons.watch_later_rounded,
          size: 32,
          color: Colors.white,
        ),
        const SizedBox(
          width: 5,
        ),
        Column(
          children: [
            const Text(
              "Duration",
              style: Styles.styleText16,
            ),
            Row(
              children: [
                Text(
                  "${detailsModel.runtime} min",
                  style: Styles.styleText20,
                ),
              ],
            ),
          ],
        )
      ],
    );
  }
}
