import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:grocery_app/models/objects.dart';
import 'package:grocery_app/providers/home/product_provider.dart';
import 'package:grocery_app/utils/util_function.dart';
import 'package:logger/logger.dart';
import 'package:provider/provider.dart';

import '../../controllers/auth_controller.dart';
import '../../screens/auth/sign_up.dart';
import '../../screens/main/main_screen.dart';

class UserPrivider extends ChangeNotifier {
  //---------User Model
  late UserModel _userModel;

  //--------get user model
  UserModel get userModel => _userModel;

  //---------loader state
  bool _isLoading = false;

  //----get loading state
  bool get loading => _isLoading;

  //-----change loading state
  void setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  //------------fetch single user
  Future<void> fetchUser(String id) async {
    try {
      //-start the loader
      setLoading(true);
      await AuthController().fetchUserData(id).then((value) {
        if (value != null) {
          Logger().w(value.email);

          _userModel = value;
          notifyListeners();
          setLoading(false);
        }
      });
    } catch (e) {}
  }

  //----------Initialize and check whether the user signed in or not
  Future<void> initializeUser(BuildContext context) async {
    FirebaseAuth.instance.authStateChanges().listen((User? user) async {
      if (user == null) {
        Logger().i("User signed out !");

        UtilFunction.navigator(context, const SignUp());
      } else {
        Logger().i("User is signed in!");
        await fetchUser(user.uid);
        // ignore: use_build_context_synchronously
        Provider.of<ProductProvider>(context, listen: false).fetchProducts();

        // ignore: use_build_context_synchronously
        UtilFunction.navigator(context, const MainScreen());
      }
    });
  }
}
