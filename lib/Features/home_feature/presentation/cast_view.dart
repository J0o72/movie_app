import 'package:flutter/material.dart';
import 'package:movie_app/Features/home_feature/presentation/widgets/cast_view_body.dart';

class CastView extends StatelessWidget {
  const CastView({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: CastViewBody(),
    );
  }
}
