import 'package:flutter/material.dart';
import 'package:spacex/core/theming/styles.dart';

class CustomErrorWidget extends StatelessWidget {
  const CustomErrorWidget({super.key, required this.errMessage});

  final String errMessage;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        errMessage,
        style: AppStyle.font10WhiteRegular,
        textAlign: TextAlign.center,
      ),
    );
  }
}
