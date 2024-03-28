import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:splitwise_clone/screens/welcome_onBoard/onBoard/presentation/onBoarding_screen.dart';
import 'package:splitwise_clone/screens/welcome_onBoard/splash/bloc/splash_scr_bloc.dart';

class SplashScreen extends StatelessWidget {
  SplashScreen({super.key});

  final splashBloc = SplashScrBloc();

  @override
  Widget build(BuildContext context) {
    splashBloc.add(AppLoaded());
    return Scaffold(
      body: BlocProvider(
        create: (_) => splashBloc,
        child: BlocListener<SplashScrBloc, SplashScrState>(
          listener: (context, state) {
            if (state is SplashLoaded) {
              Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (context) => OnBoardingScreen()));
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
                  Container(
                    height: 200,
                    width: 200,
                    margin: const EdgeInsets.only(bottom: 30),
                    color: Colors.red,
                  ),
                  const Text("Splash Screen Title"),
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

