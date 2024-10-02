import 'package:flutter/material.dart';

class ActorProfileSocialIcon extends StatelessWidget {
  const ActorProfileSocialIcon({
    super.key,
    required this.icon,
    required this.iconColor,
  });

  final IconData icon;
  final Color iconColor;

  @override
  Widget build(BuildContext context) {
    return Icon(
      icon,
      color: iconColor,
      size: 36,
    );
  }
}
