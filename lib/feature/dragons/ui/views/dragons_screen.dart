import 'package:flutter/material.dart';
import 'package:spacex/core/theming/colors.dart';
import 'package:spacex/core/theming/styles.dart';
import 'package:spacex/feature/dragons/ui/widgets/dragons_screen_body.dart';

class DragonsScreen extends StatelessWidget {
  const DragonsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManger.blackColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        foregroundColor: ColorManger.whiteColor,
        title: Text( 
          "Dragons",
          style: AppStyle.font14Whitesemibold,
        ),
      ),
      body: const DragonsScreenBody(),
    );
  }
}
