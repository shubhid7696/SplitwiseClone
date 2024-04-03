import 'package:get_it/get_it.dart';

import '../../screens/welcome_onBoard/onBoard/bloc/onBoarding_bloc.dart';
import '../../screens/welcome_onBoard/splash/bloc/splash_scr_bloc.dart';

final dependencies = GetIt.instance;

Future<void> initDependencies() async {
  dependencies.registerFactory(() => SplashScrBloc());
  dependencies.registerFactory(() => OnBoardingBloc());
}