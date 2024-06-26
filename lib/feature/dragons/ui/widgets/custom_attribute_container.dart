import 'package:flutter/material.dart';
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
              const SizedBox(
                height: 10,
              ),
              Text(
                valueKey,
                style: AppStyle.font14Whitesemibold,
              ),
              const SizedBox(
                height: 5,
              ),
              FittedBox(
                child: Text(
                  value,
                  style: AppStyle.font14Whitesemibold
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
