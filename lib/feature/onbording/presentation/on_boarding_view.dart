import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spacex/feature/onbording/logic/cubit/onbording_cubit.dart';
import 'package:spacex/feature/onbording/presentation/widgets/onbording_view_body.dart';


class OnBordingView extends StatelessWidget {
  const OnBordingView({super.key});
  static const String routeName = 'OnBording';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<OnbordingCubit, OnbordingState>(
        builder: (context, state) {
          return OnboardingViewBody(
            cubit: BlocProvider.of<OnbordingCubit>(context),
          );
        },
      ),
    );
  }
}
