import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CustomCachedImage extends StatelessWidget {
  final String? urlToImage;
  final double widthImage;
  final double heightImage;
  final BorderRadiusGeometry borderRadiusImage;
  final EdgeInsetsGeometry paddingImage;
  final EdgeInsetsGeometry marginImage;
  final Color colorImage;
  const CustomCachedImage({
    super.key,
    required this.urlToImage,
    required this.widthImage,
    required this.heightImage,
    required this.borderRadiusImage,
    required this.paddingImage,
    required this.marginImage,
    required this.colorImage,
  });

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: urlToImage ?? "",
      imageBuilder: (context, imageProvider) => Padding(
        padding: paddingImage,
        child: ClipRRect(
          borderRadius: borderRadiusImage,
          child: Container(
            width: widthImage,
            height: heightImage,
            decoration: BoxDecoration(
              color: colorImage,
              image: DecorationImage(image: imageProvider, fit: BoxFit.cover),
            ),
          ),
        ),
      ),
      progressIndicatorBuilder: (context, url, downloadProgress) => Padding(
        padding: paddingImage,
        child: ClipRRect(
          borderRadius: borderRadiusImage,
          child: Container(
            width: widthImage,
            height: heightImage,
            decoration: BoxDecoration(color: colorImage),
          ),
        ),
      ),
      errorWidget: (context, url, downloadProgress) => Padding(
        padding: paddingImage,
        child: ClipRRect(
          borderRadius: borderRadiusImage,
          child: Container(
            width: widthImage,
            height: heightImage,
            decoration: BoxDecoration(color: colorImage),
          ),
        ),
      ),
    );
  }
}
