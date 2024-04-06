
import 'dart:io';

extension FileExtension on File {
  String get extension => path.contains('.') ? path.split('.').last : '';
  String get name => path.contains('/') ? path.split('/').last : path;
}

