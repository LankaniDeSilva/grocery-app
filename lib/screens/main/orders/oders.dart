import 'package:flutter/cupertino.dart';
import 'package:grocery_app/custom_widgets/custom_text.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:grocery_app/models/objects.dart';
import 'package:grocery_app/providers/auth/user_provider.dart';
import 'package:grocery_app/providers/home/product_provider.dart';
import 'package:grocery_app/providers/order_provider/order_provider.dart';
import 'package:grocery_app/screens/main/favourite/widgets/fav_product_tile.dart';
import 'package:grocery_app/screens/main/orders/widgets/order_product_tile.dart';
import 'package:grocery_app/utils/assets_constants.dart';
import 'package:provider/provider.dart';
import '../../../utils/app_colors.dart';

class Orders extends StatefulWidget {
  const Orders({Key? key}) : super(key: key);

  @override
  State<Orders> createState() => _OrdersState();
}

class _OrdersState extends State<Orders> {
  @override
  Widget build(BuildContext context) {
    return FadeIn(
      child: Consumer<UserPrivider>(builder: (context, value, child) {
        return SafeArea(
          child: Column(
            children: [
              const Center(
                child: CustomText(
                  text: "Orders",
                  fontSize: 25.0,
                  fontWeight: FontWeight.w600,
                  color: AppColors.primaryColor,
                ),
              ),
              const SizedBox(height: 20),
              Expanded(
                child: Consumer<OrderProvider>(
                  builder: (context, value, child) {
                    return value.orders.isEmpty
                        ? const Center(child: CustomText(text: "No orders"))
                        : ListView.separated(
                            itemBuilder: (context, index) {
                              return OrderProductTile(
                                index: index + 1,
                                model: value.orders[index],
                              );
                            },
                            separatorBuilder: (context, index) =>
                                const SizedBox(
                                  height: 20,
                                ),
                            itemCount: value.orders.length);
                  },
                ),
              ),

              // Consumer<ProductProvider>(
              //   builder: (context, value, child) {
              //     return value.favproducts.isEmpty
              //         ? const Center(
              //             child: CustomText(text: "No Orders"))
              //         : ListView.separated(
              //             itemBuilder: (context, index) {
              //               return FavProductTile(
              //                 model: value.favproducts[index],
              //               );
              //             },
              //             separatorBuilder: (context, index) => const SizedBox(
              //                   height: 20,
              //                 ),
              //             itemCount: value.favproducts.length);
              //   },
              // )),
            ],
          ),
        );
      }),
    );
  }
}
