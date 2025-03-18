import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:solidsolutionweb/constants/colors.dart';

class ImageViewer extends StatelessWidget {
  const ImageViewer({
    super.key,
    this.urlImagePath = "",
    this.boxFit,
    this.height,
    this.width,
    this.borderRadius,
  });
  final String urlImagePath;
  final double? width, height;
  final BoxFit? boxFit;
  final BorderRadius? borderRadius;
  @override
  Widget build(BuildContext context) {
    return urlImagePath.isEmpty
        ? SizedBox(
            width: width ?? 400,
            height: height ?? 400,
          )
        : CachedNetworkImage(
            imageUrl: urlImagePath,
            imageBuilder: (context, imageProvider) => Container(
              width: width ?? 400,
              height: height ?? 400,
              decoration: BoxDecoration(
                borderRadius: borderRadius,
                image: DecorationImage(
                  image: imageProvider,
                  fit: boxFit,
                ),
              ),
            ),
            placeholder: (context, url) => const Padding(
              padding: EdgeInsets.all(10),
              child: Center(
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  color: AppColors.violet,
                ),
              ),
            ),
          );
  }
}
