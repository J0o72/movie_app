import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/Features/home_feature/presentation/manager/save_to_fav_cubit/save_to_fav_cubit.dart';
import 'package:movie_app/Features/home_feature/presentation/widgets/custom_circular_loading.dart';
import 'package:movie_app/constants.dart';
import 'package:movie_app/core/widgets/custom_error_failure.dart';

class CustomBookmarkIcon extends StatelessWidget {
  const CustomBookmarkIcon({
    super.key,
    required this.rightPos,
    required this.topPos,
    this.mediaID,
    this.mediaType,
  });

  final double? rightPos, topPos;
  final int? mediaID;
  final String? mediaType;
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
              onPressed: () {
                print('Id => $mediaID');
                Map<String, dynamic> body = {
                  'media_id': mediaID,
                  'media_type': mediaType,
                  'favorite': true,
                };
                BlocProvider.of<SaveToFavCubit>(context).saveToFav(body: body);
              },
              icon: state is SaveToFavInitial
                  ? const Icon(
                      Icons.bookmark_border,
                      color: Colors.white,
                      size: 32,
                    )
                  : state is SaveToFavSuccess
                      ? const Icon(
                          Icons.bookmark,
                          color: Colors.white,
                          size: 32,
                        )
                      : state is SaveToFavFailure
                          ? const Icon(
                              Icons.bookmark_border,
                              color: Colors.white,
                              size: 32,
                            )
                          : const CustomCircularLoading(),
            ),
          ),
        );
      },
    );
  }
}
