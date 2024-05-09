import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:helper/core/index.dart';
import 'package:helper/shared/providers/firebase_provider.dart';

final storageRepoProvider = Provider(
  (ref) => StorageRepository(storage: ref.watch(storageProvider)),
);

class StorageRepository {
  final FirebaseStorage _storage;
  StorageRepository({required FirebaseStorage storage}) : _storage = storage;

  FutureEitherF<String> storeFile({
    required String path,
    required String id,
    required File? file,
    required Uint8List? webFile,
  }) async {
    try {
      final ref = _storage.ref().child(path).child(id);
      UploadTask uploadTask;

      if (kIsWeb) {
        uploadTask = ref.putData(webFile!);
      } else {
        uploadTask = ref.putFile(file!);
      }

      final snapshot = await uploadTask;

      return Right(await snapshot.ref.getDownloadURL());
    } catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }
}
