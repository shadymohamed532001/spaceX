import 'package:flutter/material.dart';
import 'package:spacex/feature/rockets/ui/widgets/rockets_screen_body.dart';

class RocketScreen extends StatelessWidget {
  const RocketScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: RocketsScreenBody(),
    );
  }
}
