import 'package:flutter/cupertino.dart';
import 'package:grocery_app/custom_widgets/custom_text.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:grocery_app/providers/auth/user_provider.dart';
import 'package:grocery_app/providers/home/product_provider.dart';
import 'package:grocery_app/screens/main/favourite/widgets/fav_product_tile.dart';
import 'package:provider/provider.dart';
import '../../../utils/app_colors.dart';

class Favourite extends StatefulWidget {
  const Favourite({Key? key}) : super(key: key);

  @override
  State<Favourite> createState() => _FavouriteState();
}

class _FavouriteState extends State<Favourite> {
  @override
  Widget build(BuildContext context) {
    return FadeIn(
      child: Consumer<UserPrivider>(builder: (context, value, child) {
        return SafeArea(
          child: Column(
            children: [
              const Center(
                child: CustomText(
                  text: "Favourites",
                  fontSize: 25.0,
                  fontWeight: FontWeight.w600,
                  color: AppColors.primaryColor,
                ),
              ),
              const SizedBox(height: 20),
              Expanded(child: Consumer<ProductProvider>(
                builder: (context, value, child) {
                  return value.favproducts.isEmpty
                      ? const Center(
                          child: CustomText(text: "No Favourite Products"))
                      : ListView.separated(
                          itemBuilder: (context, index) {
                            return FavProductTile(
                              model: value.favproducts[index],
                            );
                          },
                          separatorBuilder: (context, index) => const SizedBox(
                                height: 20,
                              ),
                          itemCount: value.favproducts.length);
                },
              )),
            ],
          ),
        );
      }),
    );
  }
}
