import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:grocery_app/controllers/auth_controller.dart';
import 'package:grocery_app/custom_widgets/custom-button.dart';
import 'package:grocery_app/custom_widgets/custom_text.dart';
import 'package:grocery_app/providers/auth/user_provider.dart';
import 'package:grocery_app/screens/admin/admin.dart';
import 'package:grocery_app/utils/util_function.dart';

import 'package:logger/logger.dart';
import 'package:provider/provider.dart';

import '../../../models/objects.dart';

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
    return Container(
      child: Consumer<UserPrivider>(
        builder: (context, value, child) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: value.loading
                      ? const CircularProgressIndicator()
                      : CustomText(
                          text: value.userModel.name,
                          fontSize: 20,
                        ),
                ),
                CustomButton(
                  text: "Go to Admin",
                  onTap: () {
                    UtilFunction.navigator(context, const Admin());
                  },
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
