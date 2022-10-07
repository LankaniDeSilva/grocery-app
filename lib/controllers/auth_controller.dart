import 'dart:async';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

import 'package:logger/logger.dart';

import '../models/objects.dart';
import '../utils/alert_helper.dart';

class AuthController {
  //------Firebase auth instance
  final FirebaseAuth auth = FirebaseAuth.instance;

  //-- create the user collection
  CollectionReference users = FirebaseFirestore.instance.collection('users');

  //-----------signup function---
  Future<void> registerUser(
    BuildContext context,
    String email,
    String password,
    String name,
  ) async {
    try {
      //-------send email and password to the firebase and create a user
      await auth
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((value) async {
        //-------check if the user credentials object is not null
        Logger().w(value.user);
        if (value.user != null) {
          //------save other user data in cloud firestore
          await saveUserData(value.user!.uid, name, email);
          //--------if user created successfully show an alert
          // ignore: use_build_context_synchronously
          AlertHelper.showAlert(
            context,
            "User created successfully",
            "Success",
            DialogType.SUCCES,
          );
        }
      });
    } on FirebaseAuthException catch (e) {
      AlertHelper.showAlert(
        context,
        e.code,
        "Error",
        DialogType.ERROR,
      );
    } catch (e) {
      AlertHelper.showAlert(
        context,
        e.toString(),
        "Error",
        DialogType.ERROR,
      );
    }
  }

  //------------Sign up user in firestore cloud
  Future<void> saveUserData(String uid, String name, String email) async {
    return users
        .doc(uid)
        .set(
          {
            'name': name,
            'email': email,
            'uid': uid,
          },
          SetOptions(merge: true),
        )
        .then((value) => Logger().i("User Added"))
        .catchError((error) => Logger().e("Failed to add user: $error"));
  }

  //---------------fetch user data saved in cloud firestore
  Future<UserModel?> fetchUserData(String uid) async {
    try {
      //firebase Query that retrieve user data
      DocumentSnapshot snapshot = await users.doc(uid).get();
      Logger().i(snapshot.data());
      //------mapping fetch data to user model
      UserModel model =
          UserModel.fromJson(snapshot.data() as Map<String, dynamic>);
      Logger().i(model.email);
      return model;
    } catch (e) {
      Logger().e(e);
      return null;
    }
  }

  //-----------signin function---
  Future<void> signinUser(
    BuildContext context,
    String email,
    String password,
  ) async {
    try {
      //-------send email and password to the firebase and create a user
      final credentials = await auth.signInWithEmailAndPassword(
          email: email, password: password);

      //     .then((value) {
      //   //-------check if the user credentials exists or not null
      //   if (value.user != null) {
      //     //--------if success redirect to the home screen

      //     UtilFunction.navigator(context, const MainScreen());
      //   }
      // });
    } on FirebaseAuthException catch (e) {
      AlertHelper.showAlert(
        context,
        e.code,
        "Error",
        DialogType.ERROR,
      );
    } catch (e) {
      AlertHelper.showAlert(
        context,
        e.toString(),
        "Error",
        DialogType.ERROR,
      );
    }
  }

  // //----------Initialize and check whether the user signed in or not
  // Future<void> initializeUser(BuildContext context) async {
  //   auth.authStateChanges().listen((User? user) async {
  //     if (user == null) {
  //       Logger().i("User signed out !");

  //       UtilFunction.navigator(context, const SignUp());
  //     } else {
  //       Logger().i("User is signed in!");
  //       // await fetchUserData(user.uid);

  //       // ignore: use_build_context_synchronously
  //       UtilFunction.navigator(context, MainScreen(uid: user.uid));
  //     }
  //   });
  // }

  //--------sign out function
  Future<void> signoutUser() async {
    await auth.signOut();
  }

  //send password reset email
  Future<void> sendPasswordResetEmail(
      BuildContext context, String email) async {
    await auth.sendPasswordResetEmail(email: email).then((value) {
      //show dialog when the email is sent
      AlertHelper.showAlert(
          context, "Please check your email", "Email sent", DialogType.SUCCES);
    });
  }
}
