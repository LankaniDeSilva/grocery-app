import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

import '../../controllers/auth_controller.dart';
import '../../utils/alert_helper.dart';

class SignupProvider extends ChangeNotifier {
  //-------email text controller
  final _emailController = TextEditingController();

  //-------password text controller
  final _passwordController = TextEditingController();

  //-------name text controller
  final _nameController = TextEditingController();

  //---------loader state
  bool _isLoading = false;

  //----getter for email controller
  TextEditingController get emailController => _emailController;

  //----getter for password controller
  TextEditingController get passwordController => _passwordController;

  //----getter for name controller
  TextEditingController get nameController => _nameController;

  //----get loading state
  bool get loading => _isLoading;

  //-----change loading state
  void setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  //--validate text field function

  bool validateField(BuildContext context) {
    // first checking all the text filds are empty or not
    if (_emailController.text.isEmpty ||
        _passwordController.text.isEmpty ||
        _nameController.text.isEmpty) {
      AlertHelper.showAlert(
        context,
        "Please fill all the fileds !",
        "Error",
        DialogType.ERROR,
      );
      return false;
    } else if (!_emailController.text.contains("@")) {
      AlertHelper.showAlert(
        context,
        "Please Enter a valid email !",
        "Error",
        DialogType.ERROR,
      );

      return false;
    } else if (_passwordController.text.length < 6) {
      AlertHelper.showAlert(
        context,
        "Password must have more than 6 digits !",
        "Error",
        DialogType.ERROR,
      );
      return false;
    } else {
      return true;
    }
  }

  //---------start signup process
  Future<void> startSignup(BuildContext context) async {
    try {
      if (validateField(context)) {
        //start the loader

        setLoading(true);

        // Logger().i("Validation success");
        await AuthController().registerUser(
          context,
          _emailController.text,
          _passwordController.text,
          _nameController.text,
        );

        //clear text field
        _emailController.clear();
        _nameController.clear();
        _passwordController.clear();

        //stop the loader

        setLoading(false);
      }
    } catch (e) {
      setLoading(false);
      Logger().e(e);
      AlertHelper.showAlert(context, e.toString(), 'Error', DialogType.ERROR);
    }
  }
}
