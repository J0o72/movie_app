import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/Features/home_feature/presentation/widgets/custom_circular_loading.dart';
import 'package:movie_app/constants.dart';

class DetailsCustomPersonPhoto extends StatelessWidget {
  const DetailsCustomPersonPhoto({
    super.key,
    required this.width,
    required this.height,
  });

  final double width, height;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: kMainColor),
        borderRadius: BorderRadius.circular(50),
      ),
      width: width,
      height: height,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(50),
        child: CachedNetworkImage(
          fit: BoxFit.cover,
          imageUrl:
              'https://encrypted-tbn1.gstatic.com/licensed-image?q=tbn:ANd9GcQVvw9wM-vic6DpsytCKxIPryMNkHemJMjGyWfxL4Mu4Q7giMB9AbbMgQFRMdygvAj-xxNDjKnzL_iG9cc',
          errorWidget: (context, url, error) => const Icon(Icons.error),
          placeholder: (context, url) => const Center(
            child: CustomCircularLoading(),
          ),
        ),
      ),
    );
  }
}
