import 'package:flutter/material.dart';
import 'package:grocery_app/models/objects.dart';
import 'package:grocery_app/utils/assets_constants.dart';
import 'package:provider/provider.dart';

import '../../../../custom_widgets/custom_text.dart';
import '../../../../providers/home/product_provider.dart';
import '../../../../utils/app_colors.dart';
import '../../../../utils/size_config.dart';
import '../../../../utils/util_function.dart';
import '../../product_details/product_details.dart';

class OrderProductTile extends StatelessWidget {
  const OrderProductTile({
    Key? key,
    // required this.model,
    required this.index,
    required this.model,
  }) : super(key: key);

  // final ProductModel model;
  final int index;
  final OrderModel model;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        //---set the selected product model before navigating to the product details screen
        // Provider.of<ProductProvider>(context, listen: false).setProduct(model);
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
                    model.items.first.model.image,
                    // AssetsContants.dummyImagePath,
                    width: 70,
                    height: 70,
                    fit: BoxFit.fill,
                  ),
                ),
                const SizedBox(width: 16),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                      text: 'Order No $index',
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                    ),
                    const SizedBox(height: 10),
                    CustomText(
                      text:
                          "${model.items.first.model.productName} + ${model.items.first.model.price}",
                      fontSize: 15,
                    ),
                  ],
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 5, vertical: 2),
                  decoration: BoxDecoration(
                    color: AppColors.primaryColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: CustomText(
                    text: model.orderState,
                    color: AppColors.kWhite,
                    fontSize: 10,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                CustomText(
                  text: 'Total Rs.${model.total}0',
                  // 'Rs.${model.price}',
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
