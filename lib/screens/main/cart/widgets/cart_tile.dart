import 'package:flutter/material.dart';
import 'package:grocery_app/custom_widgets/custom_text.dart';
import 'package:grocery_app/utils/app_colors.dart';
import 'package:grocery_app/utils/assets_constants.dart';
import 'package:grocery_app/utils/size_config.dart';

class CardTile extends StatefulWidget {
  const CardTile({Key? key}) : super(key: key);

  @override
  State<CardTile> createState() => _CardTileState();
}

class _CardTileState extends State<CardTile> {
  @override
  Widget build(BuildContext context) {
    return Container(
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
                  AssetsContants.dummyImagePath,
                  width: 70,
                  height: 70,
                  fit: BoxFit.fill,
                ),
              ),
              const SizedBox(width: 16),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CustomText(
                    text: "Pumpkin",
                    fontSize: 14,
                  ),
                  Row(
                    children: const [
                      Icon(Icons.add),
                      SizedBox(width: 15),
                      CustomText(
                        text: '1',
                        fontSize: 14,
                      ),
                      SizedBox(width: 15),
                      Icon(Icons.remove),
                    ],
                  ),
                ],
              ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: const [
              Icon(
                Icons.close,
                color: AppColors.KRed,
              ),
              CustomText(
                text: 'Rs.152',
                fontSize: 15,
                fontWeight: FontWeight.w600,
              )
            ],
          )
        ],
      ),
    );
  }
}
