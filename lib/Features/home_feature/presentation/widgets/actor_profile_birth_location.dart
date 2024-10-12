import 'package:flutter/material.dart';

class ActorProfileBirthLocation extends StatelessWidget {
  const ActorProfileBirthLocation({
    super.key,
    required this.actorBirthLocation,
  });

  final String actorBirthLocation;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Icon(
          Icons.location_on_sharp,
          size: 26,
          color: Colors.red,
        ),
        const SizedBox(
          width: 5,
        ),
        Text(actorBirthLocation),
      ],
    );
  }
}
