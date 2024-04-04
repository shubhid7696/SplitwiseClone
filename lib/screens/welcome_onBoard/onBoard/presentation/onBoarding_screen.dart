import 'package:dots_indicator/dots_indicator.dart';
import 'package:splitwise_clone/res/app_imports.dart';
import 'package:splitwise_clone/screens/welcome_onBoard/onBoard/bloc/onBoarding_bloc.dart';
import '../../../../core/di_services/injections.dart';
import '../../../authenticate/login/login_screen.dart';

part 'widget/onBoarding_page.dart';

class OnBoardingScreen extends StatelessWidget {
  final pageController = PageController(initialPage: 0);
  final onBoardingBloc = dependencies<OnBoardingBloc>();

  OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var onBoardingDataList = onBoardingBloc.state.onBoardingDataList;

    return Scaffold(
      backgroundColor: primaryBackgroundColor,
      body: SafeArea(
          child: BlocProvider(
        create: (_) => onBoardingBloc,
        child: BlocBuilder<OnBoardingBloc, OnBoardingState>(
          builder: (context, state) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
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
                          imageUrl: onBoardingDataList[0].image,
                          title: onBoardingDataList[0].title,
                          desc: onBoardingDataList[0].description,
                        ),
                        _page(
                          controller: pageController,
                          context: context,
                          pageIndex: 1,
                          imageUrl: onBoardingDataList[1].image,
                          title: onBoardingDataList[1].title,
                          desc: onBoardingDataList[1].description,
                        ),
                        _page(
                          controller: pageController,
                          context: context,
                          pageIndex: 2,
                          imageUrl: onBoardingDataList[2].image,
                          title: onBoardingDataList[2].title,
                          desc: onBoardingDataList[2].description,
                        ),
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      DotsIndicator(
                        dotsCount: onBoardingDataList.length,
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
                      const Expanded(
                        child: SizedBox(),
                      ),
                      ElevatedButton(
                          onPressed: () {
                            if (state.pageIndex == 2) {
                              context.replace(RouteKeys.signUpScreen);
                            }
                            pageController.nextPage(
                                duration: const Duration(milliseconds: 300),
                                curve: Curves.easeIn);
                          },
                          child: const Text(AppStrings.nextStr)),
                    ],
                  ),
                ],
              ),
            );
          },
        ),
      )),
    );
  }
}
