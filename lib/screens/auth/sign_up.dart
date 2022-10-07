import 'package:flutter/material.dart';

import 'package:grocery_app/screens/auth/login.dart';

import 'package:grocery_app/utils/app_colors.dart';
import 'package:grocery_app/utils/assets_constants.dart';

import 'package:grocery_app/custom_widgets/custom_textfield.dart';

import 'package:provider/provider.dart';
import '../../custom_widgets/custom-button.dart';
import '../../custom_widgets/custom_text.dart';
import '../../providers/auth/signup_provider.dart';
import '../../utils/util_function.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  // //-------email text controller
  // final emailController = TextEditingController();

  // //-------password text controller
  // final passwordController = TextEditingController();

  // //-------name text controller
  // final nameController = TextEditingController();

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
                    text: "SignUp",
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
                  const SizedBox(height: 20.0),
                  CustomTextField(
                    // labelText: "Name",
                    controller:
                        Provider.of<SignupProvider>(context).nameController,
                    hintText: "Name",
                  ),
                  const SizedBox(height: 8.0),
                  CustomTextField(
                    // labelText: "Email",
                    hintText: "Email",
                    controller:
                        Provider.of<SignupProvider>(context).emailController,
                  ),
                  const SizedBox(height: 16.0),
                  CustomTextField(
                    // labelText: "Password",
                    isObscure: true,
                    hintText: "Password",
                    controller:
                        Provider.of<SignupProvider>(context).passwordController,
                  ),
                  const SizedBox(height: 16.0),
                  Align(
                    alignment: Alignment.centerRight,
                    child: InkWell(
                      onTap: () =>
                          UtilFunction.navigator(context, const Login()),
                      child: const CustomText(
                        text: "Already have an account?",
                        fontSize: 14.0,
                      ),
                    ),
                  ),
                  const SizedBox(height: 29.0),
                  //-------loading icon shows instead of button
                  Consumer<SignupProvider>(
                    builder: (context, value, child) {
                      return CustomButton(
                          isLoading: value.loading,
                          text: "SignUp",
                          onTap: () async => value.startSignup(context));

                      // if (validateField()) {
                      //   //start the loader
                      //   setState(() {
                      //     isLoading = true;
                      //   });
                      //   // Logger().i("Validation success");
                      //   await AuthController().registerUser(
                      //     context,
                      //     emailController.text,
                      //     passwordController.text,
                      //     nameController.text,
                      //   );

                      //   //clear text field
                      //   emailController.clear();
                      //   nameController.clear();
                      //   passwordController.clear();

                      //   //stop the loader
                      //   setState(() {
                      //     isLoading = false;
                      //   });
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
}
