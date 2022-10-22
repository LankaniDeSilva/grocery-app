import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:grocery_app/providers/cart/cart_provider.dart';
import 'package:grocery_app/utils/util_function.dart';
import 'package:provider/provider.dart';

import '../screens/main/cart/cart.dart';
import '../utils/app_colors.dart';
import '../utils/assets_constants.dart';
import 'custom_text.dart';

class CartButtonWidget extends StatelessWidget {
  const CartButtonWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<CartProvider>(
      builder: (context, value, child) {
        return Badge(
          badgeColor: AppColors.primaryColor,
          badgeContent: CustomText(
            text: value.getCartTotalItemCount.toString(),
            color: AppColors.kWhite,
          ),
          child: IconButton(
              onPressed: () => UtilFunction.navigator(context, const Cart()),
              icon: SvgPicture.asset(AssetsContants.cartIcon)),
        );
      },
    );
  }
}
