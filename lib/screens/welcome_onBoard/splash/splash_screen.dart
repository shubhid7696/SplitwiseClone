
import 'package:splitwise_clone/res/app_imports.dart';
import 'package:splitwise_clone/screens/welcome_onBoard/splash/bloc/splash_scr_bloc.dart';
import '../../../core/di_services/injections.dart';
import '../../../ui/widgets/image_widgets.dart';

class SplashScreen extends StatelessWidget {
  SplashScreen({super.key});

  final splashBloc = dependencies<SplashScrBloc>();

  @override
  Widget build(BuildContext context) {
    splashBloc.add(AppLoaded());
    return Scaffold(
      body: BlocProvider(
        create: (_) => splashBloc,
        child: BlocListener<SplashScrBloc, SplashScrState>(
          listener: (context, state) {
            if (state is SplashLoaded) {
              context.go(RouteKeys.onBoardingScreen);
            }
          },
          child: Scaffold(
            body: SafeArea(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(width: double.maxFinite,),
                  const NetworkAndAssetImage(
                    height: 300,
                    width: 300,
                    imagePath: AppImages.splashImage,
                  ),
                  Text(AppStrings.splashTitle, style: AppStyles.splashTitle(),),
                  const SizedBox(height: 20,),
                  const CircularProgressIndicator(
                    backgroundColor: Colors.white,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

