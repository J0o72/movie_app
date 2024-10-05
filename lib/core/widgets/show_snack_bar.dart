import 'package:flutter/material.dart';

void showSnackBar(BuildContext context, String str) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(str),
    ),
  );
}
