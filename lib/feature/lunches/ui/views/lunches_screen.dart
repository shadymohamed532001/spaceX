import 'package:flutter/material.dart';
import 'package:spacex/core/widgets/custom_app_bar.dart';
import 'package:spacex/feature/lunches/ui/widgets/lunches_screen_body.dart';

class LunchesScreen extends StatelessWidget {
  const LunchesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(
        title: 'Lunches',
      ),
      body: LunchesScreenBody(),
    );
  }
}
