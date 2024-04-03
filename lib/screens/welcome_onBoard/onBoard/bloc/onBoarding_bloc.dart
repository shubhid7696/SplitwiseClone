import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'onBoarding_data.dart';

part 'onBoarding_event.dart';
part 'onBoarding_state.dart';

class OnBoardingBloc extends Bloc<OnBoardingEvent, OnBoardingState> {
  OnBoardingBloc(): super(OnBoardingState(pageIndex: 0)){
    on<OnBoardingEvent>((event, emit) async {
      return emit(OnBoardingState(pageIndex: state.pageIndex));
    });
  }
}