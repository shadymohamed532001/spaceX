import 'package:flutter/material.dart';
import 'package:spacex/feature/layout/ui/widgets/bottom_nav_bar.dart';
import 'package:spacex/feature/layout/ui/widgets/layout_screen_body.dart';

class LayoutScreen extends StatelessWidget {
  const LayoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: LayoutScreenBody(),
      bottomNavigationBar: BottomNavBar(),
    );
  }
}
