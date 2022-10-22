import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:grocery_app/screens/main/favourite/fav.dart';
import 'package:grocery_app/screens/main/home/home.dart';
import 'package:grocery_app/screens/main/profile/profile.dart';
import 'package:grocery_app/utils/app_colors.dart';
import 'package:grocery_app/utils/assets_constants.dart';

import 'orders/oders.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  void initState() {
    // Logger().w(widget.uid);
    _screens.addAll({
      const Home(),
      const Favourite(),
      const Orders(),
      const Profile(),
    });
    super.initState();
  }

  //List to store bottom navigation screens
  final List<Widget> _screens = [];

  int index = 0;

  //onTap function
  void onItemTap(int i) {
    setState(() {
      index = i;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[index],
      bottomNavigationBar: SizedBox(
        height: 83.0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            InkWell(
              child: SvgPicture.asset(
                AssetsContants.homeIcon,
                color: index == 0 ? AppColors.primaryColor : AppColors.kAsh,
              ),
              onTap: () {
                onItemTap(0);
              },
            ),
            InkWell(
              child: SvgPicture.asset(
                AssetsContants.favouriteIcon,
                color: index == 1 ? AppColors.primaryColor : AppColors.kAsh,
              ),
              onTap: () {
                onItemTap(1);
              },
            ),
            InkWell(
              child: SvgPicture.asset(
                AssetsContants.menuIcon,
                color: index == 2 ? AppColors.primaryColor : AppColors.kAsh,
              ),
              onTap: () {
                onItemTap(2);
              },
            ),
            InkWell(
              child: SvgPicture.asset(
                AssetsContants.profileIcon,
                color: index == 3 ? AppColors.primaryColor : AppColors.kAsh,
              ),
              onTap: () {
                onItemTap(3);
              },
            ),
          ],
        ),
      ),
    );
  }
}
