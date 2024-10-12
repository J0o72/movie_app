import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/Features/home_feature/data/models/actor_model/actor_model.dart';

class ActorProfileBackgroundImage extends StatelessWidget {
  const ActorProfileBackgroundImage({
    super.key,
    required this.actorDetails,
  });

  final ActorModel actorDetails;

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: 0.3,
      child: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: CachedNetworkImage(
          fit: BoxFit.cover,
          imageUrl:
              'https://encrypted-tbn1.gstatic.com/licensed-image?q=tbn:ANd9GcQVvw9wM-vic6DpsytCKxIPryMNkHemJMjGyWfxL4Mu4Q7giMB9AbbMgQFRMdygvAj-xxNDjKnzL_iG9cc',
        ),
      ),
    );
  }
}
