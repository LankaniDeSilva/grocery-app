import 'package:flutter/material.dart';
import 'package:grocery_app/providers/auth/login_provider.dart';
import 'package:grocery_app/screens/auth/forgot_password.dart';

import 'package:grocery_app/utils/app_colors.dart';
import 'package:grocery_app/utils/assets_constants.dart';

import 'package:grocery_app/custom_widgets/custom_textfield.dart';
import 'package:grocery_app/utils/util_function.dart';

import 'package:provider/provider.dart';

import '../../custom_widgets/custom-button.dart';
import '../../custom_widgets/custom_text.dart';
import '../../custom_widgets/social_button.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  // //-------email text controller
  // final emailController = TextEditingController();

  // //-------password text controller
  // final passwordController = TextEditingController();

  // //---------loader state
  // bool isLoading = false;

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
                    text: "Login",
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
                  const SizedBox(height: 39.0),
                  CustomTextField(
                    // labelText: "Email",
                    hintText: "Email",
                    controller:
                        Provider.of<LoginProvider>(context).emailController,
                  ),
                  const SizedBox(height: 16.0),
                  CustomTextField(
                    // labelText: "Password",
                    isObscure: true,
                    hintText: "Password",
                    controller:
                        Provider.of<LoginProvider>(context).passwordController,
                  ),
                  const SizedBox(height: 16.0),
                  Align(
                    alignment: Alignment.centerRight,
                    child: InkWell(
                      onTap: () => UtilFunction.navigator(
                          context, const ForgotPassword()),
                      child: const CustomText(
                        text: "Forgot Your Password?",
                        fontSize: 14.0,
                      ),
                    ),
                  ),
                  const SizedBox(height: 29.0),
                  Consumer<LoginProvider>(
                    builder: ((context, value, child) {
                      return CustomButton(
                        text: "Login",
                        isLoading: value.loading,
                        onTap: () async {
                          value.startLogin(context);
                          // if (validateField()) {
                          //   //start the loader
                          //   setState(() {
                          //     isLoading = true;
                          //   });
                          //   // Logger().i("Validation success");
                          //   await AuthController().signinUser(context,
                          //       emailController.text, passwordController.text);

                          //   //clear text field
                          //   emailController.clear();
                          //   passwordController.clear();

                          //   //stop the loader
                          //   setState(() {
                          //     isLoading = false;
                          //   });
                          // } else {
                          //   Logger().e("authentication faild");
                          // }
                        },
                      );
                    }),
                  ),
                  const SizedBox(height: 23.0),
                  const CustomText(
                    text: "Or Login With social account",
                    fontSize: 14.0,
                  ),
                  const SizedBox(height: 12.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SocialButton(
                        iconPath: AssetsContants.googleIcon,
                        onTap: () {},
                      ),
                      const SizedBox(width: 16.0),
                      SocialButton(
                        iconPath: AssetsContants.fbIcon,
                        onTap: () {},
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
