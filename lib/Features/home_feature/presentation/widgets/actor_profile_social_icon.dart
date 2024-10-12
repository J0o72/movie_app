import 'package:flutter/material.dart';

class ActorProfileSocialIcon extends StatelessWidget {
  const ActorProfileSocialIcon({
    super.key,
    required this.icon,
    required this.iconColor,
    this.onTap,
  });

  final IconData icon;
  final Color iconColor;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Icon(
        icon,
        color: iconColor,
        size: 36,
      ),
    );
  }
}
