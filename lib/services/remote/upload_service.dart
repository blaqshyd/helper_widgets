import 'dart:developer';
import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';

class UploadService {
  final FirebaseStorage _storage = FirebaseStorage.instance;

  Future<List<String>> uploadFiles(List<File> files, String path) async {
    List<String> imageUrls = [];

    for (File file in files) {
      Uint8List fileData = await file.readAsBytes();
      final ref = _storage.ref().child('$path/${DateTime.now()}');
      final uploadTask = ref.putData(fileData);

      final snapshot = await uploadTask.whenComplete(() {
        log('DONE');
      });
      String imageUrl = await snapshot.ref.getDownloadURL();
      imageUrls.add(imageUrl);
    }

    return imageUrls;
  }

  Future<String> uploadFile(File file, String path) async {
    // String imageUrl;

    final ref = _storage.ref().child('$path/${DateTime.now()}');
    final uploadTask = ref.putData(file.readAsBytesSync());

    final snapshot = await uploadTask.whenComplete(() {
      log('DONE');
    });
    // imageUrl = await snapshot.ref.getDownloadURL();

    return  await snapshot.ref.getDownloadURL();
  }
}
