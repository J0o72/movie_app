import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/Features/home_feature/presentation/widgets/custom_circular_loading.dart';

class CustomImageCarouselItem extends StatelessWidget {
  const CustomImageCarouselItem({super.key, required this.imageUrl});

  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: CachedNetworkImage(
        fit: BoxFit.fill,
        errorWidget: (context, url, error) => const Icon(Icons.error),
        placeholder: (context, url) => const CustomCircularLoading(),
        imageUrl: imageUrl,
      ),
    );
  }
}
