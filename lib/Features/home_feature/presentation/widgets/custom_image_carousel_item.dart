import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

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
        placeholder: (context, url) => const Center(
          child: CircularProgressIndicator(),
        ),
        imageUrl: imageUrl,
      ),
    );
  }
}
