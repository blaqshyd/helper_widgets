import 'package:flutter/material.dart';
import 'package:helper/services/local/cache_image.dart';

class MultiImages extends StatelessWidget {
  const MultiImages({
    super.key,
    required this.imageUrls,
  });

  final List<String> imageUrls;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        if (imageUrls.length == 3)
          _build(imageUrls)
        else
          GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: imageUrls.length == 1 ? 1 : 2,
              mainAxisExtent:
                  imageUrls.length == 3 || imageUrls.length >= 4 ? 140 : 240,
            ),
            itemCount: imageUrls.length > 4 ? 4 : imageUrls.length,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              if (index == 3 && imageUrls.length > 4) {
                return Stack(
                  children: [
                    _buildImageWidget(imageUrls[index - 1]),
                    Positioned.fill(
                      child: Container(
                        color: Colors.black.withOpacity(0.5),
                        child: Center(
                          child: Text(
                            '+${imageUrls.length - 4}',
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              } else {
                return _buildImageWidget(imageUrls[index]);
              }
            },
          ),
      ],
    );
  }
}

Widget _buildImageWidget(String imageUrl) {
  return CacheNetwork.imageDeco(
    imageUrl,
    width: double.infinity,
    height: double.infinity,
    margin: const EdgeInsets.all(1),
  );
}

Widget _build(List<String> imageUrls) {
  return SizedBox(
    height: 230,
    child: Row(
      children: [
        Expanded(
          child: Column(
            children: [
              Expanded(child: _buildImageWidget(imageUrls[0])),
              Expanded(child: _buildImageWidget(imageUrls[1])),
            ],
          ),
        ),
        Expanded(child: _buildImageWidget(imageUrls[2])),
      ],
    ),
  );
}
