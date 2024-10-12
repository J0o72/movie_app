import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:movie_app/Features/home_feature/data/models/details_model/casts_model.dart';
import 'package:movie_app/Features/home_feature/presentation/widgets/details_custom_person_photo.dart';
import 'package:movie_app/core/utils/app_routes.dart';
import 'package:movie_app/core/utils/styles.dart';

class ActorsItem extends StatelessWidget {
  const ActorsItem({super.key, required this.castsModel});

  final CastsModel castsModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: InkWell(
        onTap: () {
          print(castsModel.id);
          GoRouter.of(context)
              .push(AppRouter.kActorProfileView, extra: castsModel.id);
        },
        child: SizedBox(
          width: 100,
          child: Column(
            children: [
              DetailsCustomPersonPhoto(
                castsModel: castsModel,
                height: 93,
                width: 93,
              ),
              const SizedBox(
                height: 5,
              ),
              Center(
                child: Text(
                  castsModel.name.toString(),
                  textAlign: TextAlign.center,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: Styles.styleText16.copyWith(
                    height: 1,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
