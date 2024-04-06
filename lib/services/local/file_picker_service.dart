import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:helper/core/extensions/extensions_.dart';

class FilePickerService {
  static Future<File?> pickFile() async {
    final result = await FilePicker.platform.pickFiles();
    if (result != null) {
      File? pickedFile = await result.asFile;
      if (pickedFile != null) {
        return pickedFile;
      }
    }
    return null;
  }

  static Future<List<File>?> pickImages() async {
    final result = await FilePicker.platform.pickFiles(allowMultiple: true);

    if (result != null) {
      List<File> files = result.paths.map((path) => File(path!)).toList();
      return files;
    } else {
      return null;
    }
  }

  static Future<File?> pickDocument() async {
    final result = await FilePicker.platform.pickFiles(
      allowedExtensions: ['.pdf', '.xls'],
    );
    if (result != null) {
      File? pickedFile = await result.asFile;
      if (pickedFile != null) {
        return pickedFile;
      }
    }
    return null;
  }

  static Future<File?> pickImage() async {
    final image = await FilePicker.platform.pickFiles(type: FileType.image);
    if (image != null) return image.asFile;

    return null;
  }

  static Future<File?> pickVideo() async {
    final video = await FilePicker.platform.pickFiles(type: FileType.video);
    if (video != null) return video.asFile;
    return null;
  }
}
