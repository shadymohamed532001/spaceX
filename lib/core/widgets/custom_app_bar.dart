import 'package:flutter/material.dart';
import 'package:spacex/core/theming/colors.dart';
import 'package:spacex/core/theming/styles.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    super.key,
    required this.title,
  });
  final String title;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      leading: IconButton(
        // for Ui Not Have a Logic <>
        onPressed: () {},
        icon: const Icon(
          Icons.arrow_back_ios,
          color: ColorManger.whiteColor,
        ),
      ),
      title: Text(
        title,
        style: AppStyle.font18Whitesemibold,
      ),
      centerTitle: true,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
