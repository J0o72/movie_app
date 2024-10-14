import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/Features/home_feature/presentation/manager/save_to_fav_cubit/save_to_fav_cubit.dart';
import 'package:movie_app/Features/home_feature/presentation/widgets/custom_circular_loading.dart';
import 'package:movie_app/constants.dart';

class CustomBookmarkIcon extends StatelessWidget {
  const CustomBookmarkIcon({
    super.key,
    required this.rightPos,
    required this.topPos,
    this.onPressed,
    this.isBookmarked = false,
  });

  final double? rightPos, topPos;
  final Function()? onPressed;
  final bool? isBookmarked;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SaveToFavCubit, SaveToFavState>(
      builder: (context, state) {
        return Positioned(
          right: rightPos,
          top: topPos,
          child: CircleAvatar(
            backgroundColor: kMainColor.withOpacity(0.8),
            child: IconButton(
                padding: EdgeInsets.zero,
                alignment: Alignment.center,
                onPressed: onPressed,
                icon: isBookmarked!
                    ? const Icon(
                        Icons.bookmark,
                        color: Colors.white,
                        size: 32,
                      )
                    : const Icon(
                        Icons.bookmark_border,
                        color: Colors.white,
                        size: 32,
                      )
                // state is SaveToFavInitial
                //     ? const Icon(
                //         Icons.bookmark_border,
                //         color: Colors.white,
                //         size: 32,
                //       )
                //     : state is SaveToFavSuccess
                //         ? const Icon(
                //             Icons.bookmark,
                //             color: Colors.white,
                //             size: 32,
                //           )
                //         : state is SaveToFavFailure
                //             ? const Icon(
                //                 Icons.bookmark_border,
                //                 color: Colors.white,
                //                 size: 32,
                //               )
                //             : const CustomCircularLoading(),
                ),
          ),
        );
      },
    );
  }
}
