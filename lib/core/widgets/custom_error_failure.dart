import 'package:flutter/material.dart';

class CustomErrorFailure extends StatelessWidget {
  const CustomErrorFailure({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        "Error",
        textAlign: TextAlign.center,
      ),
    );
  }
}
