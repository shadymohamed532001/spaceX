import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:spacex/feature/lunches/ui/widgets/custom_luches_item.dart';

class LunchesScreenBody extends StatelessWidget {
  const LunchesScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: CustomScrollView(
        slivers: [
          SliverList.builder(
            itemCount: 10,
            itemBuilder: (context, index) {
              return const Padding(
                padding: EdgeInsets.only(top: 8),
                child: CustomLuchesItem(),
              );
            },
          )
        ],
      ),
    );
  }
}
