import 'package:flutter/material.dart';
import 'package:helper/constants/app_assets.dart';
import 'package:helper/modules/gridview_posts/multi_images.dart';

class GridViewNetwork extends StatefulWidget {
  const GridViewNetwork({Key? key}) : super(key: key);

  @override
  GridViewNetworkState createState() => GridViewNetworkState();
}

class GridViewNetworkState extends State<GridViewNetwork> {
  List<String> imageUrls = [
    AppAssets.image,
    AppAssets.image,
    AppAssets.image,
    AppAssets.image,
    AppAssets.image,
    AppAssets.image,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('GridView for network'),
      ),
      body: Center(
        child: MultiImages(imageUrls: imageUrls),
      ),
    );
  }
}
