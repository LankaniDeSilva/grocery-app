import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../custom_widgets/custom_text.dart';
import '../../../../models/objects.dart';
import '../../../../providers/home/product_provider.dart';
import '../../../../utils/app_colors.dart';
import '../../../../utils/size_config.dart';
import '../../../../utils/util_function.dart';
import '../../product_details/product_details.dart';

class FavProductTile extends StatelessWidget {
  const FavProductTile({
    Key? key,
    required this.model,
  }) : super(key: key);

  final ProductModel model;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        //---set the selected product model before navigating to the product details screen
        Provider.of<ProductProvider>(context, listen: false).setProduct(model);
        //----------navigate to product details screen
        UtilFunction.navigator(context, const ProductDetails());
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 30),
        height: 90,
        padding: const EdgeInsets.all(10),
        width: SizeConfig.getWidth(context),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: AppColors.kWhite,
          boxShadow: [
            BoxShadow(
              offset: const Offset(0, 10),
              blurRadius: 20,
              color: AppColors.kAsh.withOpacity(0.4),
            )
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image.network(
                    model.image,
                    width: 70,
                    height: 70,
                    fit: BoxFit.fill,
                  ),
                ),
                const SizedBox(width: 16),
                CustomText(
                  text: model.productName,
                  fontSize: 14,
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                InkWell(
                  onTap: () =>
                      Provider.of<ProductProvider>(context, listen: false)
                          .initAddtoFavourite(model, context),
                  child: const Icon(
                    Icons.close,
                    color: AppColors.KRed,
                  ),
                ),
                CustomText(
                  text: 'Rs.${model.price}',
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
