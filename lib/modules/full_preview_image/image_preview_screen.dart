import 'package:flutter/material.dart';
import 'package:helper/shared/shared.dart';
import 'package:helper/core/extensions/extensions_.dart';
import 'package:helper/modules/full_preview_image/image_preview_s.dart';
import 'package:helper/modules/gridview_posts/multi_images.dart';
import 'package:helper/modules/text_overflow/flexible_text.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

class FullImagePreview extends StatefulWidget {
  const FullImagePreview({super.key});

  @override
  FullImagePreviewState createState() => FullImagePreviewState();
}

class FullImagePreviewState extends State<FullImagePreview> {
  var image = AppAssets.image;
  List<String> imageUrls = [
    AppAssets.image,
    AppAssets.image,
    AppAssets.image,
  ];

  List<IconData> icons = [
    Iconsax.heart_copy,
    Iconsax.message,
    Iconsax.aave_aave
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Profile Picture Viewer'),
        ),
        body: ListView.separated(
          separatorBuilder: (context, index) => const Divider(),
          itemCount: 4,
          itemBuilder: (context, index) => Column(
            children: [
              24.sbH,
              ImagePreviewS(image: image),
              const FlexibleText(),
              MultiImages(imageUrls: imageUrls),
              4.sbH,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: icons.map((e) => Icon(e)).toList(),
              )
            ],
          ),
        ));
  }
}
