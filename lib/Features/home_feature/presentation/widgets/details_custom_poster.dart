import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/Features/home_feature/presentation/widgets/custom_circular_loading.dart';

class DetailsCustomPoster extends StatelessWidget {
  const DetailsCustomPoster({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.4,
      width: MediaQuery.of(context).size.width,
      child: CachedNetworkImage(
        fit: BoxFit.cover,
        imageUrl:
            'https://cdn.marvel.com/content/1x/avengersendgame_lob_mas_mob_01.jpg',
        errorWidget: (context, url, error) => const Icon(Icons.error),
        placeholder: (context, url) => const Center(
          child: CustomCircularLoading(),
        ),
      ),
    );
  }
}
