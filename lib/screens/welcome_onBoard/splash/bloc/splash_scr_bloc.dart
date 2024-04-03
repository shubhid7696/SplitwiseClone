import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'splash_scr_event.dart';
part 'splash_scr_state.dart';

class SplashScrBloc extends Bloc<SplashScrEvent, SplashScrState> {
  SplashScrBloc(): super(SplashInitial()){
    on<SplashScrEvent>((event, emit) async {
      if(event is AppLoaded) {
        await Future.delayed(const Duration(seconds: 3));
        emit(SplashLoaded());
      }
    });
  }
}