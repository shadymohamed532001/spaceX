import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spacex/core/helpers/spacing.dart';
import 'package:spacex/core/theming/styles.dart';
import 'package:spacex/feature/onbording/logic/cubit/onbording_cubit.dart';

class TittleAndSubtittleText extends StatelessWidget {
  const TittleAndSubtittleText({super.key, required this.index});

  final int index;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          context
              .read<OnbordingCubit>()
              .onBoardingRepo
              .onBoardingPages()[index]
              .tittle,
          style: AppStyle.font28Whitebold,
        ),
        verticalSpacing(10),
        Text(
          context
              .read<OnbordingCubit>()
              .onBoardingRepo
              .onBoardingPages()[index]
              .subtittle,
          style: AppStyle.font16GreyMedium,
        ),
      ],
    );
  }
}
