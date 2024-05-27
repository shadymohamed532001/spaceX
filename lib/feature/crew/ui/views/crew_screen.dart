import 'package:flutter/material.dart';
import 'package:spacex/core/widgets/custom_app_bar.dart';
import 'package:spacex/feature/crew/ui/widgets/crew_screeen_body.dart';

class CrewScreen extends StatelessWidget {
  const CrewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(title: 'Crew'),
      body: CrewScreenBody(),
    );
  }
}
