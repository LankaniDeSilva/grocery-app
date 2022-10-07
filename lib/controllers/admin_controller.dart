import 'dart:async';
import 'dart:io';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:logger/logger.dart';
import "package:path/path.dart";

import '../utils/alert_helper.dart';

class AdminController {
  //------Firebase auth instance
  final FirebaseAuth auth = FirebaseAuth.instance;

  //-- create the user collection
  CollectionReference products =
      FirebaseFirestore.instance.collection('products');

  //-----------save Product function---
  Future<void> saveProduct(
    BuildContext context,
    String productName,
    String desc,
    String price,
    File img,
  ) async {
    try {
      //------uploading the image file
      UploadTask? task = uploadFile(img);

      final snapshot = await task!.whenComplete(() {});

      //-------getting the download url
      final String downloadUrl = await snapshot.ref.getDownloadURL();

      //-getting an unique document ID
      String docid = products.doc().id;

      //-saving the producy data in cloud firestore
      await products.doc(docid).set({
        "id": docid,
        "productName": productName,
        "description": desc,
        "price": double.parse(price),
        "imageUrl": downloadUrl,
      });
    } catch (e) {
      AlertHelper.showAlert(context, e.toString(), "Error", DialogType.ERROR);
    }
  }

  //---------upload pick image file to the firebase storage bucket and return the download link
  UploadTask? uploadFile(File file) {
    try {
      //---------getting the file name from the file path
      final String fileName = basename(file.path);

      //--------defining the file storage destination in the firebase storage
      final String destination = 'productImages/$fileName';

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
