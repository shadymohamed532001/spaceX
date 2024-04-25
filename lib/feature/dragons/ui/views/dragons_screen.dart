import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spacex/core/theming/colors.dart';
import 'package:spacex/feature/dragons/logic/get_dragons_cubit/get_dragons_cubit.dart';
import 'package:spacex/feature/dragons/ui/widgets/dragons_screen_body.dart';

import '../../../../core/di/service_locator.dart';

class DragonsScreen extends StatelessWidget {
  const DragonsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) =>
          serviceLocator.get<GetDragonsCubit>()..getAllDragons(),
      child: const Scaffold(
        backgroundColor: ColorManger.blackColor,
        body: DragonsScreenBody(),
      ),
    );
  }
}
