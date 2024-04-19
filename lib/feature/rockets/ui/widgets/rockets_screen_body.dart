import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:spacex/feature/rockets/ui/widgets/rocket_launcher_item.dart';

class RocketsScreenBody extends StatelessWidget {
  const RocketsScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 16.w,
        right: 16.w,
      ),
      child: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: 10,
              itemBuilder: (context, index) {
                return const RocketLauncherItem();
              },
            ),
          ),
        ],
      ),
    );
  }
}
