import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:image_picker/image_picker.dart';

extension FileExtension on File {
  String get extension => path.contains('.') ? path.split('.').last : '';
  String get name => path.contains('/') ? path.split('/').last : path;
}

extension FilePickerExtension on FilePickerResult {
  Future<File?> get asFile async {
    if (files.isNotEmpty) {
      final filePath = files.single.path;
      if (filePath != null) {
        return File(filePath);
      }
    }
    return null;
  }
}

/// For [ImagePicker]
extension ToFile on Future<XFile?> {
  Future<File?> toFile() => then((xFile) => xFile?.path).then(
        (filePath) => filePath != null ? File(filePath) : null,
      );
}
