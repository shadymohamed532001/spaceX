import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spacex/core/theming/styles.dart';
import 'package:spacex/feature/onbording/logic/cubit/onbording_cubit.dart';
import 'package:spacex/feature/onbording/presentation/widgets/custom_dot_items.dart';
import 'package:spacex/feature/onbording/presentation/widgets/tittle_and_subtittle_text.dart';

class OnboardingViewBody extends StatefulWidget {
  const OnboardingViewBody({
    super.key,
    required this.cubit,
  });
  final OnbordingCubit cubit;

  @override
  State<OnboardingViewBody> createState() => _OnboardingViewBodyState();
}

class _OnboardingViewBodyState extends State<OnboardingViewBody> {
  late PageController pageController;

  @override
  void initState() {
    pageController = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: pageController,
      onPageChanged: (index) {
        widget.cubit.onChangePageIndex(index);
      },
      itemCount:
          BlocProvider.of<OnbordingCubit>(context).onBoardingPages().length,
      itemBuilder: (context, index) {
        return SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.1,
                ),
                Center(
                  child: Image.asset(
                    BlocProvider.of<OnbordingCubit>(context)
                        .onBoardingPages()[index]
                        .imagepath!,
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.12,
                ),
                FadeInUp(
                  child: TittleAndSubtittleText(index: index),
                ),
                const Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomDotItems(
                      currnetIndex: index,
                    ),
                    FadeInRight(
                      duration: const Duration(milliseconds: 700),
                      child: Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: GestureDetector(
                          onTap: () {
                            widget.cubit.navigateBetweenPages(
                              context: context,
                              pageController: pageController,
                            );
                          },
                          child: Text(
                            index ==
                                    BlocProvider.of<OnbordingCubit>(context)
                                            .onBoardingPages()
                                            .length -
                                        1
                                ? 'Get Started Now'
                                : 'Next',
                            style: AppStyle.font18Whitesemibold,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
/* Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(
                  widget.cubit.onBoardingRepo
                      .onBoardingPages()[index]
                      .imagepath!,
                ),
                verticalSpacing(40),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 32),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      FadeInUp(
                        child: TittleAndSubtittleText(index: index),
                      ),
                      verticalSpacing(81),
                      
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ); */
