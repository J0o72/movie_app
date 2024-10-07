import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/Features/home_feature/presentation/manager/details_cubit/details_cubit.dart';
import 'package:movie_app/Features/home_feature/presentation/widgets/custom_back_arrow_icon.dart';
import 'package:movie_app/Features/home_feature/presentation/widgets/custom_bookmark_icon.dart';
import 'package:movie_app/Features/home_feature/presentation/widgets/custom_circular_loading.dart';
import 'package:movie_app/Features/home_feature/presentation/widgets/details_custom_poster.dart';
import 'package:movie_app/Features/home_feature/presentation/widgets/details_view_body_information.dart';
import 'package:movie_app/core/widgets/custom_error_failure.dart';

class DetailsViewBodyContent extends StatelessWidget {
  const DetailsViewBodyContent({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DetailsCubit, DetailsState>(
      builder: (context, state) {
        if (state is DetailsSuccess) {
          if (state.detailsModel != null) {
            return CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: Column(
                    children: [
                      Stack(
                        children: [
                          DetailsCustomPoster(
                            detailsModel: state.detailsModel!,
                          ),
                          const CustomBookmarkIcon(
                            rightPos: 20,
                            topPos: 40,
                          ),
                          const CustomBackArrowIcon(),
                        ],
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.black.withOpacity(0.5),
                          boxShadow: const [
                            BoxShadow(
                              blurRadius: 150,
                              color: Colors.black,
                              offset: Offset(0, 0),
                              spreadRadius: 70,
                            ),
                          ],
                        ),
                        child: DetailsViewBodyInformation(
                          detailsModel: state.detailsModel!,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            );
          } else {
            return CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: Column(
                    children: [
                      Stack(
                        children: [
                          DetailsCustomPoster(
                            tvShowsDetailsModel: state.tvShowsDetailsModel,
                          ),
                          const CustomBookmarkIcon(
                            rightPos: 20,
                            topPos: 40,
                          ),
                          const CustomBackArrowIcon(),
                        ],
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.black.withOpacity(0.5),
                          boxShadow: const [
                            BoxShadow(
                              blurRadius: 150,
                              color: Colors.black,
                              offset: Offset(0, 0),
                              spreadRadius: 70,
                            ),
                          ],
                        ),
                        child: DetailsViewBodyInformation(
                          tvShowsDetailsModel: state.tvShowsDetailsModel,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            );
          }
        } else if (state is DetailsFailure) {
          print(state.errorMessage);
          return const CustomErrorFailure();
        } else {
          return const CustomCircularLoading();
        }
      },
    );
  }
}
