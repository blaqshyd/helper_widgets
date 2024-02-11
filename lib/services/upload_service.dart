import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final uploadServiceProvider = Provider((ref) => UploadService());

class UploadService {
  final FirebaseStorage _storage = FirebaseStorage.instance;

  Future<List<String>> uploadPostImages(List<File> files) async {
    List<String> imageUrls = [];

    for (File file in files) {
      Uint8List fileData = await file.readAsBytes();
      final reference =
          _storage.ref().child('images/${DateTime.now().toString()}');
      final uploadTask = reference.putData(fileData);

      final snapshot = await uploadTask.whenComplete(() {});
      String imageUrl = await snapshot.ref.getDownloadURL();
      imageUrls.add(imageUrl);
    }

    return imageUrls;
  }

  Future<String> uploadProfileImg(File fileData) async {
    String imageUrl;

    final reference = _storage.ref().child('profiles/${DateTime.now()}');
    final uploadTask = reference.putData(fileData.readAsBytesSync());

    final snapshot = await uploadTask.whenComplete(() {});
    imageUrl = await snapshot.ref.getDownloadURL();

    return imageUrl;
  }
}
