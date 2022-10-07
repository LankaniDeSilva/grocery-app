import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:grocery_app/utils/app_colors.dart';
import 'package:grocery_app/utils/assets_constants.dart';

import 'package:grocery_app/custom_widgets/custom_textfield.dart';
import 'package:logger/logger.dart';
import '../../controllers/auth_controller.dart';
import '../../custom_widgets/custom-button.dart';
import '../../custom_widgets/custom_text.dart';
import '../../utils/alert_helper.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({Key? key}) : super(key: key);

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  //-------email text controller
  final emailController = TextEditingController();

  //---------loader state
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          width: size.width,
          child: SafeArea(
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 52.0),
                  const CustomText(
                    text: "Forgot Password",
                    fontSize: 25.0,
                    fontWeight: FontWeight.w600,
                    color: AppColors.primaryColor,
                  ),
                  const SizedBox(height: 41),
                  Image.asset(
                    AssetsContants.logo,
                    width: 202.26,
                    height: 138.0,
                  ),
                  const SizedBox(height: 100.0),
                  const CustomText(
                    text:
                        "Please, enter your email address. You will receive a link to create a new password via email.",
                    fontSize: 14.0,
                  ),
                  const SizedBox(height: 16.0),
                  CustomTextField(
                    // labelText: "Email",
                    hintText: "Email",
                    controller: emailController,
                  ),
                  const SizedBox(height: 16.0),
                  const SizedBox(height: 53.0),
                  CustomButton(
                    text: "Send Reset Password",
                    isLoading: isLoading,
                    onTap: () async {
                      if (validateField()) {
                        //start the loader
                        setState(() {
                          isLoading = true;
                        });
                        // Logger().i("Validation success");
                        await AuthController().sendPasswordResetEmail(
                            context, emailController.text);

                        //clear text field
                        emailController.clear();

                        //stop the loader
                        setState(() {
                          isLoading = false;
                        });
                      } else {
                        Logger().e("authentication faild");
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  //--validate text field function

  bool validateField() {
    // first checking all the text filds are empty or not
    if (emailController.text.isEmpty) {
      AlertHelper.showAlert(
        context,
        "Please fill all the fileds !",
        "Error",
        DialogType.ERROR,
      );
      return false;
    } else if (!emailController.text.contains("@")) {
      AlertHelper.showAlert(
        context,
        "Please Enter a valid email !",
        "Error",
        DialogType.ERROR,
      );

      return false;
    } else {
      return true;
    }
  }
}
