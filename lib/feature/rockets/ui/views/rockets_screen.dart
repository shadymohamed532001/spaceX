import 'package:flutter/material.dart';

import 'package:spacex/core/widgets/custom_app_bar.dart';
import 'package:spacex/feature/rockets/ui/widgets/rockets_screen_body.dart';

class RocketScreen extends StatelessWidget {
  const RocketScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(
        title: 'Rockets',
      ),
      body: RocketsScreenBody(),
    );
  }
}
