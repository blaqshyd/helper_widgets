import 'dart:io';

import 'package:image_picker/image_picker.dart';

class ImagePickerService {
  static final ImagePicker _picker = ImagePicker();
  //
  static Future<List<File>> pickImages() async {
    List<File> images = [];

    final imageFiles = await _picker.pickMultiImage();
    if (imageFiles.isNotEmpty) {
      for (final image in imageFiles) {
        images.add(File(image.path));
      }
    }
    return images;
  }

  static pickImageGallery() async {
    final image = await _picker.pickImage(source: ImageSource.gallery);
    return image;
  }

  static pickImageCamera() async {
    final image = await _picker.pickImage(source: ImageSource.camera);
    return image;
    // if (image != null) return File(image.path);
  }

  static pickVideoGallery() async {
    final video = await _picker.pickVideo(source: ImageSource.gallery);
    return video;
  }

  static pickVideoCamera() async {
    final video = await _picker.pickVideo(source: ImageSource.camera);
    return video;
  }
}
