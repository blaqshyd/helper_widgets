import 'dart:io';

import 'package:flutter/material.dart';
import 'package:helper/services/local/file_picker_service.dart';

class GridViewPick extends StatefulWidget {
  const GridViewPick({super.key});

  @override
  GridViewPickState createState() => GridViewPickState();
}

class GridViewPickState extends State<GridViewPick> {
  final ValueNotifier<List<File>> _pickedFilesNotifier = ValueNotifier([]);

  void _pickImages() async {
    List<File>? pickedImages = await FilePickerService.pickImages();

    _pickedFilesNotifier.value = pickedImages!;
  }

  Widget _buildImageWidget(File image) {
    return Container(
      height: 240,
      width: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          image: FileImage(image),
        ),
      ),
    );
  }

  Widget _buildGridView(List<File> images) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 1.0,
        mainAxisSpacing: 2.0,
        mainAxisExtent: images.length == 3 || images.length >= 4 ? 140 : 240,
      ),
      itemCount: images.length > 4 ? 4 : images.length,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        if (index == 3 && images.length > 4) {
          return Stack(
            children: [
              _buildImageWidget(images[index - 1]),
              Positioned.fill(
                child: Container(
                  color: Colors.black.withOpacity(0.5),
                  child: Center(
                    child: Text(
                      '+${images.length - 3}',
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
          return _buildImageWidget(images[index]);
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('GridView for pictures'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ValueListenableBuilder<List<File>>(
              valueListenable: _pickedFilesNotifier,
              builder: (context, pickedFiles, _) {
                if (pickedFiles.isEmpty) {
                  // return const SizedBox.shrink();
                  return Container(
                    height: 240,
                    width: double.infinity,
                    color: Colors.grey.withOpacity(0.3),
                    child: const Center(
                      child: Text('No images selected'),
                    ),
                  );
                } else if (pickedFiles.length == 1) {
                  return _buildImageWidget(pickedFiles.first);
                } else {
                  return _buildGridView(pickedFiles);
                }
              },
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _pickImages,
              child: const Text('Pick Images'),
            ),
          ],
        ),
      ),
    );
  }
}
