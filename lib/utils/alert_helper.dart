import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/cupertino.dart';

class AlertHelper {
  //-------- function to show alert dialog box

  static Future<dynamic> showAlert(
    BuildContext context,
    String desc,
    String title,
    DialogType dialogType,
  ) async {
    return AwesomeDialog(
      context: context,
      dialogType: dialogType,
      animType: AnimType.RIGHSLIDE,
      title: title,
      desc: desc,
      btnCancelOnPress: () {},
      btnOkOnPress: () {},
    )..show();
  }

  //-------show snackbar function
  static void showSnackbar(
    String msg,
    AnimatedSnackBarType type,
    BuildContext context,
  ) {
    AnimatedSnackBar.material(
      msg,
      type: type,
      duration: const Duration(milliseconds: 500),
    ).show(context);
  }
}
