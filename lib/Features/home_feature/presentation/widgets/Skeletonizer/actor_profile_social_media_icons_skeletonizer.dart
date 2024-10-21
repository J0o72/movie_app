import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:skeletonizer/skeletonizer.dart';

class ActorProfileSocialMediaIconsSkeletonizer extends StatelessWidget {
  const ActorProfileSocialMediaIconsSkeletonizer({super.key});

  @override
  Widget build(BuildContext context) {
    return const Skeletonizer(
      enabled: true,
      child: Row(
        children: [
          Icon(
            Icons.facebook,
            color: Colors.blue,
            size: 36,
          ),
          Icon(
            FontAwesomeIcons.instagram,
            color: Colors.red,
            size: 36,
          ),
          Icon(
            FontAwesomeIcons.xTwitter,
            color: Colors.grey,
            size: 36,
          ),
        ],
      ),
    );
  }
}
