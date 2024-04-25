import 'package:flutter/material.dart';
import 'package:spacex/core/theming/styles.dart';

class CustomAttributesContainer extends StatelessWidget {
  const CustomAttributesContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 8.0),
      child: Container(
        height: 90,
        width: 90,
        decoration: ShapeDecoration(
            color: Colors.grey.shade900,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            )),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 10.0,
          ),
          child: Column(
            children: [
              Text(
                "229.6",
                style: AppStyle.font16WhiteSemiBold,
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                "Height,ft",
                style: AppStyle.font16WhiteSemiBold
                    .copyWith(color: Colors.white54),
              )
            ],
          ),
        ),
      ),
    );
  }
}
