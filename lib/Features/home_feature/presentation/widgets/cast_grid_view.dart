import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/Features/home_feature/presentation/manager/cast_cubit/cast_cubit.dart';
import 'package:movie_app/Features/home_feature/presentation/manager/genre_cubit/genre_cubit.dart';
import 'package:movie_app/Features/home_feature/presentation/widgets/Skeletonizer/cast_grid_view_skeletonizer.dart';
import 'package:movie_app/Features/home_feature/presentation/widgets/details_actors_item.dart';
import 'package:movie_app/core/widgets/custom_error_failure.dart';

class CastGridView extends StatefulWidget {
  const CastGridView({super.key, required this.fromWhere, required this.id});
  final String fromWhere;
  final int id;

  @override
  State<CastGridView> createState() => _CastGridViewState();
}

class _CastGridViewState extends State<CastGridView> {
  @override
  void initState() {
    super.initState();
    if (widget.fromWhere == 'movie') {
      BlocProvider.of<CastCubit>(context)
          .fetchCastsList(id: widget.id, fromWhere: widget.fromWhere);
    } else if (widget.fromWhere == 'tv') {
      BlocProvider.of<CastCubit>(context)
          .fetchCastsList(id: widget.id, fromWhere: widget.fromWhere);
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CastCubit, CastState>(
      builder: (context, state) {
        if (state is CastSuccess) {
          return GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              mainAxisSpacing: 30,
            ),
            itemCount: state.castsModel!.length,
            itemBuilder: (context, index) {
              return ActorsItem(
                castsModel: state.castsModel![index],
              );
            },
          );
        } else if (state is GenreFailure) {
          return const CustomErrorFailure();
        } else {
          return const CastGridViewSkeletonizer();
        }
      },
    );
  }
}
