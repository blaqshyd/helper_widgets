import 'dart:developer';
import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:helper/shared/providers/firebase_provider.dart';

final uploadProvider = Provider((ref) {
  return UploadService(ref.watch(storageProvider));
});

class UploadService {
  UploadService(this._storage);
  final FirebaseStorage _storage;

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

  Future<String> uploadFile({
    required File file,
    required String path,
    required String userId,
  }) async {
    final profileRef = _storage.ref().child(path).child(userId);
    final uploadTask = profileRef.putData(file.readAsBytesSync());

    final snapshot = await uploadTask.whenComplete(() {
      log('DONE');
    });

    String imageUrl = await snapshot.ref.getDownloadURL();
    return imageUrl;
  }
}
