import 'package:flutter/material.dart';
import 'package:helper/core/extensions/index.dart';
import 'package:helper/shared/widgets/app_dialogs.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

class ImagePreviewS extends StatelessWidget {
  final String image;
  const ImagePreviewS({
    super.key,
    required this.image,
  });
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: 8.padH,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // ImagePreview(image: image),
          12.sbW,
          // Column(
          //   crossAxisAlignment: CrossAxisAlignment.start,
          //   mainAxisAlignment: MainAxisAlignment.center,
          //   children: [
          //     'Jane Doe'.txt(fontSize: 16, fontWeight: FontWeight.w600),
          //     'Dec 03'.txt(
          //       fontSize: 14,
          //       fontWeight: FontWeight.w400,
          //       color: AppColor.lGreenDark,
          //     ),
          //   ],
          // ),
          const Spacer(),
          IconButton(
            onPressed: () => showImagePreview(context),
            icon: const Icon(Iconsax.more_copy),
          )
        ],
      ),
    );
  }

  showImagePreview(BuildContext ctx) {
    return Dialogs.empty(
      ctx,
      shape: const CircleBorder(),
      child: Container(
        height: 200,
        width: 200,
        color: Colors.amber,
        child: 'Text'.txt(),
      ),
    );
  }
}
