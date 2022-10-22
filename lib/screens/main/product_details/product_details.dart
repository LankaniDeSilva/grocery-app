import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:grocery_app/custom_widgets/cart_button.dart';
import 'package:grocery_app/custom_widgets/custom-button.dart';
import 'package:grocery_app/custom_widgets/custom_text.dart';
import 'package:grocery_app/models/objects.dart';
import 'package:grocery_app/providers/cart/cart_provider.dart';
import 'package:grocery_app/providers/home/product_provider.dart';
import 'package:grocery_app/screens/main/product_details/widget/counter_section.dart';
import 'package:grocery_app/screens/main/product_details/widget/related_product_type.dart';
import 'package:grocery_app/utils/assets_constants.dart';
import 'package:grocery_app/utils/size_config.dart';
import 'package:provider/provider.dart';

import '../../../custom_widgets/back_btn.dart';
import '../../../utils/app_colors.dart';

class ProductDetails extends StatefulWidget {
  const ProductDetails({Key? key}) : super(key: key);

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Consumer<ProductProvider>(
          builder: (context, value, child) {
            return SizedBox(
              height: SizeConfig.getHeight(context),
              width: SizeConfig.getWidth(context),
              child: Stack(
                children: [
                  Column(
                    children: [
                      Container(
                        width: SizeConfig.getWidth(context),
                        height: 286,
                        decoration: BoxDecoration(
                          color: AppColors.primaryColor,
                          image: DecorationImage(
                            image: NetworkImage(
                              // "https://media.istockphoto.com/vectors/pumpkin-flat-design-vegetable-icon-vector-id1017915018?k=20&m=1017915018&s=612x612&w=0&h=P9swKR83-uYkc3j5uGVboTH9Q7mouaAhm9FbJZMnmGc="
                              value.productModel.image,
                            ),
                            fit: BoxFit.cover,
                          ),
                        ),
                        child: const SafeArea(
                          child: Align(
                            alignment: Alignment.topLeft,
                            child: BackBtn(),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Positioned(
                    top: 256,
                    child: Container(
                      width: SizeConfig.getWidth(context),
                      height: SizeConfig.getHeight(context),
                      padding: const EdgeInsets.fromLTRB(29, 34, 29, 0),
                      decoration: BoxDecoration(
                        color: AppColors.kWhite,
                        borderRadius: BorderRadius.circular(34),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CustomText(
                                text: value.productModel.productName,
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                              ),
                              const CounterSection(),
                            ],
                          ),
                          const SizedBox(height: 21),
                          CustomText(
                            text: 'Rs. ${value.productModel.price}0',
                            fontSize: 14,
                          ),
                          const SizedBox(height: 28),
                          CustomText(
                            text: value.productModel.desc,
                            fontSize: 14,
                            textAlign: TextAlign.justify,
                          ),
                          const SizedBox(height: 26),
                          //-------related items section
                          const CustomText(
                            text: 'Related items',
                            fontSize: 14,
                            color: AppColors.darkGreen,
                          ),
                          const SizedBox(height: 20),
                          SizedBox(
                            height: 85,
                            child: Consumer<ProductProvider>(
                                builder: ((context, value, child) {
                              return ListView.separated(
                                  scrollDirection: Axis.horizontal,
                                  itemBuilder: (context, index) {
                                    //----------hide the selected product
                                    // return value.productModel.productId ==
                                    //         value.products[index].productId
                                    //     ? Container()
                                    //     : RelatedProductTile(
                                    //         productModel:
                                    //             value.products[index]
                                    //             );
                                    return RelatedProductTile(
                                        productModel:
                                            value.relatedProducts[index]);
                                  },
                                  separatorBuilder: (context, index) =>
                                      const SizedBox(width: 21),
                                  itemCount: value.relatedProducts.length);
                            })),
                          )
                        ],
                      ),
                    ),
                  ),
                  SafeArea(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Align(
                            alignment: Alignment.bottomCenter,
                            child: Consumer<ProductProvider>(
                              builder: (context, value, child) {
                                return CustomButton(
                                  text: "Add to Cart",
                                  onTap: () {
                                    Provider.of<CartProvider>(context,
                                            listen: false)
                                        .addToCart(value.productModel, context);
                                  },
                                );
                              },
                            )),
                        const SizedBox(width: 10),
                        const CartButtonWidget()
                      ],
                    ),
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
