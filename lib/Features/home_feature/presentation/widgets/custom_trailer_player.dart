import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/Features/home_feature/presentation/manager/cubit/trailler_cubit.dart';
import 'package:movie_app/Features/home_feature/presentation/widgets/custom_circular_loading.dart';
import 'package:movie_app/core/utils/functions/url_launcher.dart';
import 'package:movie_app/core/utils/styles.dart';
import 'package:movie_app/core/widgets/show_snack_bar.dart';

class CustomTrailerPlayer extends StatelessWidget {
  const CustomTrailerPlayer({
    super.key,
  });

  final String youtubeLink = 'https://www.youtube.com/watch?v=';

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TraillerCubit, TraillerState>(
      builder: (context, state) {
        if (state is TraillerSuccess) {
          return Container(
            decoration: BoxDecoration(
              border: Border.all(
                color: const Color(0xff7c889f),
              ),
              color: const Color(0xff7c889f).withOpacity(0.3),
              borderRadius: BorderRadius.circular(16),
            ),
            child: GestureDetector(
              onTap: () {
                urllauncher(context, '$youtubeLink${state.traillerResult.key}');
              },
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    padding: EdgeInsets.zero,
                    alignment: Alignment.centerLeft,
                    onPressed: () {},
                    icon: const Icon(
                      Icons.play_arrow_rounded,
                      size: 55,
                      color: Colors.red,
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(right: 12),
                    child: Text(
                      "Trailer",
                      style: Styles.styleText22,
                    ),
                  ),
                ],
              ),
            ),
          );
        } else if (state is TraillerFailure) {
          return Container(
            decoration: BoxDecoration(
              border: Border.all(
                color: const Color(0xff7c889f),
              ),
              color: const Color(0xff7c889f).withOpacity(0.3),
              borderRadius: BorderRadius.circular(16),
            ),
            child: GestureDetector(
              onTap: () {
                showSnackBar(context, 'The Trailler Not Available Yet');
              },
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    padding: EdgeInsets.zero,
                    alignment: Alignment.centerLeft,
                    onPressed: () {},
                    icon: const Icon(
                      Icons.play_arrow_rounded,
                      size: 55,
                      color: Colors.red,
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(right: 12),
                    child: Text(
                      "Trailer",
                      style: Styles.styleText22,
                    ),
                  ),
                ],
              ),
            ),
          );
        } else {
          return const CustomCircularLoading();
        }
      },
    );
  }
}
