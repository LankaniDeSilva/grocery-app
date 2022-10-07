import 'dart:io';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:grocery_app/controllers/admin_controller.dart';
import 'package:grocery_app/utils/alert_helper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:logger/logger.dart';

import '../../controllers/auth_controller.dart';

class AdminProvider extends ChangeNotifier {
  //-------product name text controller
  final _pronameController = TextEditingController();

  //-------description text controller
  final _descController = TextEditingController();

  //-------price text controller
  final _priceController = TextEditingController();

  //---------loader state
  bool _isLoading = false;

  //----getter for email controller
  TextEditingController get productNameController => _pronameController;

  //----getter for password controller
  TextEditingController get descController => _descController;

  //----getter for name controller
  TextEditingController get priceController => _priceController;

  //----get loading state
  bool get loading => _isLoading;

  //-----change loading state
  void setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  //------pick an image
  //-image picker instance
  final ImagePicker _picker = ImagePicker();

  //-------file object
  File _image = File("");

  //-getter for image
  File get image => _image;

  //-------function to pick file from gallery
  Future<void> selectImage() async {
    try {
      // Pick an image
      final XFile? pickFile =
          await _picker.pickImage(source: ImageSource.gallery);

      //-check if the user has pick a file or not
      if (pickFile != null) {
        //-assign to the file object
        _image = File(pickFile.path);
        notifyListeners();
      } else {
        Logger().e("No image selected");
      }
    } catch (e) {
      Logger().e(e);
    }
  }

  //---------start add product process
  Future<void> addProduct(BuildContext context) async {
    try {
      //start the loader

      setLoading(true);

      // Logger().i("Validation success");
      await AdminController().saveProduct(
        context,
        _pronameController.text,
        _descController.text,
        _priceController.text,
        image,
      );

      //clear text field
      _pronameController.clear();
      _priceController.clear();
      _descController.clear();

      //stop the loader

      setLoading(false);
    } catch (e) {
      setLoading(false);
      Logger().e(e);
      AlertHelper.showAlert(context, e.toString(), 'Error', DialogType.ERROR);
    }
  }
}
