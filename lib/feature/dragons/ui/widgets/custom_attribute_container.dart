import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:spacex/core/theming/styles.dart';

class CustomAttributesContainer extends StatelessWidget {
  const CustomAttributesContainer(
      {super.key, required this.value, required this.valueKey});
  final String value;
  final String valueKey;

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
                valueKey,
                style: AppStyle.font16WhiteSemiBold,
              ),
              const SizedBox(
                height: 10,
              ),
              FittedBox(
                fit: BoxFit.scaleDown,
                child: Text(
                  value,
                  style: AppStyle.font16WhiteSemiBold
                      .copyWith(color: Colors.white54, fontSize: 13),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
