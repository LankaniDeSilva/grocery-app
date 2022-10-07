import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:grocery_app/controllers/auth_controller.dart';
import 'package:grocery_app/providers/auth/user_provider.dart';
import 'package:grocery_app/screens/auth/sign_up.dart';
import 'package:grocery_app/utils/app_colors.dart';
import 'package:grocery_app/utils/assets_constants.dart';
import 'package:grocery_app/utils/util_function.dart';
import 'package:provider/provider.dart';

import '../../custom_widgets/custom_text.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();

    // Future.delayed(const Duration(seconds: 3), () {
    //   // Navigator.push(
    //   //     context, MaterialPageRoute(builder: (context) => const SignUp()));
    //   UtilFunction.navigator(context, const SignUp());
    // });
    // AuthController().initializeUser(context);
    Provider.of<UserPrivider>(context, listen: false).initializeUser(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FadeInDown(child: Image.asset(AssetsContants.logo)),
            const SizedBox(height: 72.0),
            FadeInUp(
              child: const CustomText(
                text: 'Shop Your Daily \nNecessary',
                textAlign: TextAlign.center,
                fontSize: 30.0,
                fontWeight: FontWeight.w500,
                color: AppColors.primaryColor,
              ),
            )
          ],
        ),
      ),
    );
  }
}
