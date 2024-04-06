import 'package:flutter/material.dart';
import 'package:helper/shared/shared.dart';
import 'package:helper/core/extensions/extensions_.dart';
import 'package:helper/services/cache_image.dart';

class ImagePreview extends StatelessWidget {
  const ImagePreview({
    super.key,
    required this.image,
  });

  final String image;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: 8.padH,
      child: GestureDetector(
        onTap: () => _showImageDialog(context, url: image),
        child: CacheNetwork.imageDeco(
          image,
          width: 50,
          height: 50,
          shape: BoxShape.circle,
        ),
      ),
    );
  }

  void _showImageDialog(BuildContext ctx, {required String url}) {
    showDialog(
      context: ctx,
      barrierColor: AppColor.black10.withOpacity(.9),
      builder: (BuildContext context) {
        return Dialog(
          shape: const CircleBorder(),
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: 300,
            decoration: BoxDecoration(
              backgroundBlendMode: BlendMode.dstATop,
              color: AppColor.black6,
              shape: BoxShape.circle,
              image: DecorationImage(
                colorFilter: const ColorFilter.mode(
                  AppColor.background,
                  BlendMode.colorBurn,
                ),
                image: NetworkImage(url),
                fit: BoxFit.cover,
              ),
            ),
          ),
        );
      },
    );
  }
}
