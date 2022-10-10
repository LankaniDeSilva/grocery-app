import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:grocery_app/custom_widgets/back_btn.dart';
import 'package:grocery_app/custom_widgets/custom-button.dart';
import 'package:grocery_app/screens/main/cart/widgets/cart_tile.dart';
import 'package:grocery_app/utils/assets_constants.dart';

import '../../../custom_widgets/custom_text.dart';
import '../../../utils/app_colors.dart';
import '../../../utils/size_config.dart';

class Cart extends StatefulWidget {
  const Cart({Key? key}) : super(key: key);

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                BackBtn(),
                CustomText(
                  text: "Cart",
                  fontSize: 25.0,
                  fontWeight: FontWeight.w600,
                  color: AppColors.primaryColor,
                ),
                SizedBox(height: 28),
                Icon(
                  Icons.abc,
                  color: AppColors.kWhite,
                )
              ],
            ),
            Expanded(
              child: ListView.separated(
                  itemBuilder: (context, index) {
                    return const CardTile();
                  },
                  separatorBuilder: (context, index) => const SizedBox(
                        height: 20,
                      ),
                  itemCount: 10),
            )
          ],
        ),
      ),
      bottomNavigationBar: Container(
        height: 270,
        width: SizeConfig.getWidth(context),
        padding: const EdgeInsets.symmetric(horizontal: 30),
        color: AppColors.kWhite,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CartAmountRow(
              text: 'Item total',
              amount: '20.49',
            ),
            const CartAmountRow(
              text: 'Discount',
              amount: '-10',
            ),
            const CartAmountRow(
              text: 'Tax',
              amount: '2',
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                CustomText(
                  text: 'Total',
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
                CustomText(
                  text: 'Rs.1200',
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ],
            ),
            const SizedBox(height: 20),
            CustomButton(
              text: 'Place Order',
              onTap: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return const DialogBoxContainer();
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class DialogBoxContainer extends StatelessWidget {
  const DialogBoxContainer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElasticIn(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Stack(
            alignment: Alignment.center,
            clipBehavior: Clip.none,
            children: [
              Container(
                width: 300,
                height: 333,
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
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(AssetsContants.dialogIcon),
                    const SizedBox(height: 23),
                    const CustomText(
                      textAlign: TextAlign.center,
                      text: 'Thanks for Buying\nFrom Us!',
                      color: AppColors.primaryColor,
                      fontSize: 20,
                    )
                  ],
                ),
              ),
              Positioned(
                  bottom: -20,
                  child: CustomButton(text: 'See Order', onTap: () {}))
            ],
          ),
        ],
      ),
    );
  }
}

class CartAmountRow extends StatelessWidget {
  const CartAmountRow({
    Key? key,
    required this.text,
    required this.amount,
  }) : super(key: key);

  final String text;
  final String amount;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CustomText(
            text: text,
            fontSize: 14,
          ),
          CustomText(
            text: 'Rs.${amount}',
            fontSize: 14,
          ),
        ],
      ),
    );
  }
}
