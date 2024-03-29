import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:solidsolutionweb/constants/colors.dart';

class ImageViewer extends StatelessWidget {
  const ImageViewer({
    super.key,
    this.urlImagePath = "",
  });
  final String urlImagePath;
  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: urlImagePath,
      imageBuilder: (context, imageProvider) => Container(
        width: 400,
        height: 400,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: imageProvider,
          ),
        ),
      ),
      placeholder: (context, url) => const Padding(
        padding: EdgeInsets.all(10),
        child: CircularProgressIndicator(
          strokeWidth: 2,
          color: AppColors.violet,
        ),
      ),
    );
  }
}
