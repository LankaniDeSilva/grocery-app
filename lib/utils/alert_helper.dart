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
}
