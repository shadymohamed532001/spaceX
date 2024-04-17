import 'package:flutter/material.dart';
import 'package:spacex/feature/dragons/ui/widgets/dragons_screen_body.dart';

class DragonsScreen extends StatelessWidget {
  const DragonsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: DragonsScreenBody(),
    );
  }
}
