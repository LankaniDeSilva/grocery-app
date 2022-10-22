import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:grocery_app/custom_widgets/custom-button.dart';
import 'package:grocery_app/custom_widgets/custom_text.dart';
import 'package:grocery_app/providers/auth/user_provider.dart';
import 'package:grocery_app/screens/admin/admin.dart';
import 'package:grocery_app/utils/assets_constants.dart';
import 'package:grocery_app/utils/util_function.dart';
import 'package:provider/provider.dart';
import '../../../utils/app_colors.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  // UserModel? userModel;
  // @override
  // void initState() {
  //   getData();
  //   super.initState();
  // }

  // Future<void> getData() async {
  //   await AuthController().fetchUserData(widget.uid).then((value) {
  //     if (value != null) {
  //       Logger().w(value.email);
  //       setState(() {
  //         userModel = value;
  //       });
  //     }
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: FadeIn(
        child: Consumer<UserPrivider>(
          builder: (context, value, child) {
            return SafeArea(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      const Center(
                        child: CustomText(
                          text: "Profile",
                          fontSize: 25.0,
                          fontWeight: FontWeight.w600,
                          color: AppColors.primaryColor,
                        ),
                      ),
                      const SizedBox(height: 122),
                      // SvgPicture.asset(AssetsContants.profileplaceholder),
                      value.loading
                          ? const SpinKitRotatingCircle(
                              color: Colors.white,
                              size: 40.0,
                            )
                          : InkWell(
                              onTap: () => value.selectImageAndUpload(),
                              child: Image.network(
                                value.userModel.img,
                                width: 200,
                                height: 200,
                                fit: BoxFit.cover,
                              ),
                            ),
                      const SizedBox(height: 30),
                      CustomText(
                        text: value.userModel.name,
                        fontSize: 18.0,
                        color: AppColors.kBlack,
                      ),
                      const SizedBox(height: 8),
                      CustomText(
                        text: value.userModel.email,
                        fontSize: 13.0,
                        color: AppColors.profileEmail,
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      CustomButton(
                        text: "Go to Admin",
                        onTap: () {
                          UtilFunction.navigator(context, const Admin());
                        },
                      ),
                      const SizedBox(height: 8),
                      CustomButton(
                        text: "Logout",
                        onTap: () {
                          UtilFunction.navigator(context, const Admin());
                        },
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
