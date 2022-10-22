import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:logger/logger.dart';
import "package:path/path.dart";

class FileUploadController {
  //-------upload the picked image file to the firebase storage in given folder path

  static UploadTask? uploadFile(File file, String folderName) {
    try {
      //---------getting the file name from the file path
      final String fileName = basename(file.path);

      //--------defining the file storage destination in the firebase storage
      final String destination = '$folderName/$fileName';

      //--------creating the firebase storage instance with the destination file location
      final ref = FirebaseStorage.instance.ref(destination);

      final task = ref.putFile(file);

      return task;
    } catch (e) {
      Logger().e(e);
      return null;
    }
  }
}
