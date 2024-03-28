part of 'splash_scr_bloc.dart';

@immutable
sealed class SplashScrState {}

class SplashInitial extends SplashScrState{}

class SplashLoading extends SplashScrState{}

class SplashLoaded extends SplashScrState{}