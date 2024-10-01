import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/constants.dart';
import 'package:movie_app/core/utils/styles.dart';

class ActorsItem extends StatelessWidget {
  const ActorsItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 8),
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: kMainColor),
              borderRadius: BorderRadius.circular(50),
            ),
            width: 100,
            height: 100,
            child: const CircleAvatar(
              backgroundImage: CachedNetworkImageProvider(
                "https://encrypted-tbn1.gstatic.com/licensed-image?q=tbn:ANd9GcQVvw9wM-vic6DpsytCKxIPryMNkHemJMjGyWfxL4Mu4Q7giMB9AbbMgQFRMdygvAj-xxNDjKnzL_iG9cc",
              ),
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Center(
            child: Text(
              "Chris\nHemsworth",
              textAlign: TextAlign.center,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: Styles.styleText16.copyWith(height: 1),
            ),
          )
        ],
      ),
    );
  }
}
