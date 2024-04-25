import 'package:flutter/material.dart';

import 'custom_attribute_container.dart';

class CustomAttributesListView extends StatelessWidget {
  const CustomAttributesListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 90,
      child: ListView.builder(
          itemCount: 10,
          scrollDirection: Axis.horizontal,
          itemBuilder: (BuildContext context, int index) {
            return const CustomAttributesContainer();
          }),
    );
  }
}
