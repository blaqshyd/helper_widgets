import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

/// Relies on the circular_network_image package
/// The loader is a spin-off of the SpinKit package
/// Either Placeholder or ProgressIndicator is allowed but not both

class CacheNetwork {
  static Widget image(String imageUrl, {double? width, double? height}) {
    return CachedNetworkImage(
      imageUrl: imageUrl,
      width: width ?? double.infinity,
      height: height ?? 160,
      placeholder: (context, url) => const LinearProgressIndicator(),
      errorWidget: (context, url, error) => const Icon(Icons.warning_amber),
      // progressIndicatorBuilder: (context, url, downloadProgress) =>
      //     LinearProgressIndicator(
      //   value: downloadProgress.progress,
      //   minHeight: 1,
      // ),
    );
  }

  static Widget imageDeco(
    String imageUrl, {
    double? height,
    double? width,
    EdgeInsetsGeometry? margin,
    BoxFit? fit,
    BoxShape? shape,
  }) {
    return CachedNetworkImage(
      imageUrl: imageUrl,
      imageBuilder: (context, imageProvider) => Container(
        margin: margin,
        width: width ?? double.infinity,
        height: height ?? 160,
        decoration: BoxDecoration(
          shape: shape ?? BoxShape.rectangle,
          image: DecorationImage(
            image: imageProvider,
            fit: fit ?? BoxFit.cover,
          ),
        ),
      ),
      placeholder: (context, url) => const LinearProgressIndicator(),
      errorWidget: (context, url, error) => const Icon(Icons.error),
      // progressIndicatorBuilder: (context, url, downloadProgress) =>
      //     LinearProgressIndicator(
      //   value: downloadProgress.progress,
      //   minHeight: 1,
      // ),
    );
  }
}
