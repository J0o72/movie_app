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
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Icon(
          Icons.location_on_sharp,
          size: 26,
          color: Colors.red,
        ),
        const SizedBox(
          width: 5,
        ),
        actorBirthLocation.length >= 40
            ? SizedBox(
                width: MediaQuery.of(context).size.width * 0.8,
                child: Text(
                  actorBirthLocation,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                ),
              )
            : Text(
                actorBirthLocation,
              )
      ],
    );
  }
}
