import 'package:animate_do/animate_do.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:grocery_app/controllers/auth_controller.dart';
import 'package:grocery_app/custom_widgets/custom_text.dart';
import 'package:grocery_app/utils/assets_constants.dart';

import '../../../utils/app_colors.dart';
import 'widgets/products_grid.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 28),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SvgPicture.asset(AssetsContants.menuIcon),
                Row(
                  children: [
                    SvgPicture.asset(AssetsContants.cartIcon),
                    IconButton(
                        onPressed: () {
                          AuthController().signoutUser();
                        },
                        icon: const Icon(Icons.logout)),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 25),
            const CustomText(
              text: "Vegetables",
              fontSize: 20.0,
              fontWeight: FontWeight.w600,
              color: AppColors.primaryColor,
            ),
            const SizedBox(height: 41.0),
            const ProductGrid()
          ],
        ),
      ),
    );
  }
}
