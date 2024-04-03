import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:splitwise_clone/screens/authenticate/register/register_screen.dart';
import 'package:splitwise_clone/screens/home/presentation/home_screen.dart';
import 'package:splitwise_clone/screens/welcome_onBoard/onBoard/presentation/onBoarding_screen.dart';
import 'package:splitwise_clone/screens/welcome_onBoard/splash/splash_screen.dart';

part 'route_keys.dart';

GoRouter appRoutes = GoRouter(
  debugLogDiagnostics: kDebugMode,
  initialLocation: RouteKeys.initialScreen,
  routes: <RouteBase>[
    GoRoute(
      path: RouteKeys.initialScreen,
      builder: (BuildContext context, GoRouterState state){
        return SplashScreen();
      }
    ),
    GoRoute(
        path: RouteKeys.onBoardingScreen,
        builder: (BuildContext context, GoRouterState state){
          return OnBoardingScreen();
        }
    ),
    GoRoute(
        path: RouteKeys.signUpScreen,
        builder: (BuildContext context, GoRouterState state){
          return RegisterScreen();
        }
    ),
    GoRoute(
        path: RouteKeys.homeScreen,
        builder: (BuildContext context, GoRouterState state){
          return HomeScreen();
        }
    ),
  ]
);