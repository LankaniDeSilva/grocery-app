import 'package:flutter/material.dart';
import 'package:grocery_app/providers/admin/admin_provider.dart';

import 'package:grocery_app/screens/auth/login.dart';

import 'package:grocery_app/utils/app_colors.dart';
import 'package:grocery_app/utils/assets_constants.dart';

import 'package:grocery_app/custom_widgets/custom_textfield.dart';

import 'package:provider/provider.dart';
import '../../custom_widgets/custom-button.dart';
import '../../custom_widgets/custom_text.dart';
import '../../providers/auth/signup_provider.dart';
import '../../utils/util_function.dart';

class Admin extends StatefulWidget {
  const Admin({Key? key}) : super(key: key);

  @override
  State<Admin> createState() => _AdminState();
}

class _AdminState extends State<Admin> {
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
                    text: "Save Product",
                    fontSize: 25.0,
                    fontWeight: FontWeight.w600,
                    color: AppColors.primaryColor,
                  ),
                  const SizedBox(height: 41),
                  Consumer<AdminProvider>(
                    builder: (context, value, child) {
                      return value.image.path == ""
                          ? IconButton(
                              onPressed: () {
                                value.selectImage();
                              },
                              icon: const Icon(Icons.image))
                          : InkWell(
                              onTap: () {
                                value.selectImage();
                              },
                              child: Image.file(value.image),
                            );
                    },
                  ),

                  const SizedBox(height: 20.0),
                  CustomTextField(
                    // labelText: "Name",
                    controller: Provider.of<AdminProvider>(context)
                        .productNameController,
                    hintText: "Product Name",
                  ),
                  const SizedBox(height: 8.0),
                  CustomTextField(
                    // labelText: "Email",
                    hintText: "Description",
                    controller:
                        Provider.of<AdminProvider>(context).descController,
                  ),
                  const SizedBox(height: 16.0),
                  CustomTextField(
                    // labelText: "Password",

                    hintText: "Price",
                    controller:
                        Provider.of<AdminProvider>(context).priceController,
                  ),
                  const SizedBox(height: 16.0),

                  const SizedBox(height: 29.0),
                  //-------loading icon shows instead of button
                  Consumer<AdminProvider>(
                    builder: (context, value, child) {
                      return CustomButton(
                          isLoading: value.loading,
                          text: "Save Products",
                          onTap: () async => value.addProduct(context));
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
