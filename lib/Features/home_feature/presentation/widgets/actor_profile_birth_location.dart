import 'package:flutter/material.dart';

class ActorProfileBirthLocation extends StatelessWidget {
  const ActorProfileBirthLocation({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          Icons.location_on_sharp,
          size: 26,
          color: Colors.red,
        ),
        SizedBox(
          width: 5,
        ),
        Text("Melbourne, Victoria, Australia")
      ],
    );
  }
}
