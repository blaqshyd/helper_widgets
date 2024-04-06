import 'package:flutter/material.dart';
import 'package:helper/shared/shared.dart';

class PrecacheImage extends StatefulWidget {
  const PrecacheImage({super.key});

  @override
  PrecacheImageState createState() => PrecacheImageState();
}

class PrecacheImageState extends State<PrecacheImage> {
  final String imageUrl = AppAssets.image;
  @override
  void didChangeDependencies() {
    //provide the image provider to precached Image
    precacheImage(NetworkImage(imageUrl), context);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            ClipOval(
              child: Image(
                height: 80,
                width: 80,
                image: NetworkImage(imageUrl),
                fit: BoxFit.cover,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
