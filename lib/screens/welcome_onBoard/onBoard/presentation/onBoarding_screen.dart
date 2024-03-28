import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:splitwise_clone/screens/welcome_onBoard/onBoard/bloc/onBoarding_bloc.dart';

import '../../../authenticate/login/login_screen.dart';

part 'widget/onBoarding_page.dart';

class OnBoardingScreen extends StatelessWidget {
  final pageController = PageController(initialPage: 0);
  final onBoardingBloc = OnBoardingBloc();

  OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: BlocProvider(
        create: (_) => onBoardingBloc,
        child: BlocBuilder<OnBoardingBloc, OnBoardingState>(
          builder: (context, state) {
            return Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                const SizedBox(
                  height: 10,
                ),
                Expanded(
                  child: PageView(
                    controller: pageController,
                    onPageChanged: (value) {
                      state.pageIndex = value;
                      onBoardingBloc.add(OnBoardingEvent());
                    },
                    children: [
                      _page(
                        controller: pageController,
                        context: context,
                        pageIndex: 0,
                        imageUrl: 'assets/images/page1.png',
                        title: 'Boost Productivity',
                        desc:
                            'Elevate your productivity to new heights and grow with us',
                      ),
                      _page(
                        controller: pageController,
                        context: context,
                        pageIndex: 1,
                        imageUrl: 'assets/images/page2.png',
                        title: 'Work Seamlessly',
                        desc:
                            'Get your work done seamlessly without interruption',
                      ),
                      _page(
                        controller: pageController,
                        context: context,
                        pageIndex: 2,
                        imageUrl: 'assets/images/page3.png',
                        title: 'Achieve Higher Goals',
                        desc:
                            'By boosting your producivity we help you achieve higher goals',
                      ),
                    ],
                  ),
                ),
                DotsIndicator(
                  dotsCount: 3,
                  position: onBoardingBloc.state.pageIndex,
                  decorator: DotsDecorator(
                    color: Colors.blue.withOpacity(0.2),
                    activeColor: Colors.red,
                    size: const Size.square(9.0),
                    activeSize: const Size(36.0, 9.0),
                    activeShape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0)),
                  ),
                ),
                ElevatedButton(
                    onPressed: () {
                      pageController.nextPage(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeIn);
                    },
                    child: Text("Next")),
              ],
            );
          },
        ),
      )),
    );
  }
}
