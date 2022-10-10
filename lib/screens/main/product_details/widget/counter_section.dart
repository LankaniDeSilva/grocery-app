import 'package:flutter/material.dart';

import '../../../../custom_widgets/custom_text.dart';
import '../../../../utils/app_colors.dart';

class CounterSection extends StatelessWidget {
  const CounterSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 3),
      decoration: BoxDecoration(
        border: Border.all(
          color: AppColors.ashBorder,
          width: 2,
        ),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
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
    );
  }
}
