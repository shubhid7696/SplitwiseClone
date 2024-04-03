import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:splitwise_clone/core/util/string_extension.dart';
import 'package:splitwise_clone/screens/authenticate/register/domain/entities/register_form_bloc_model.dart';

part 'register_form_event.dart';
part 'register_form_state.dart';

class RegisterFormBloc extends Bloc<RegisterFormEvent, RegisterFormState> {
  RegisterFormBloc() : super(RegisterFormInitial()) {
    on<InitEvent>(_initFormState);
    on<NameChangeEvent>(_nameChangeEvent);
    on<EmailChangeEvent>(_emailChangeEvent);
    on<PasswordChangeEvent>(_passwordChangeEvent);
    on<FormSubmitEvent>(_formSubmitEvent);
    on<FormResetEvent>(_formResetEvent);
  }

  final _formKey = GlobalKey<FormState>();

  FutureOr<void> _initFormState(InitEvent event, Emitter<RegisterFormState> emit) {
    emit(state.copyWith(formKey: _formKey));
  }

  FutureOr<void> _nameChangeEvent(NameChangeEvent event, Emitter<RegisterFormState> emit) {
    emit(
        state.copyWith(
          formKey: _formKey,
          name: RegisterFormBlocModel(
            value: event.name.value,
            error: event.name.value.isValidName ? null : "Enter Name"
          )
        )
    );
  }

  FutureOr<void> _emailChangeEvent(EmailChangeEvent event, Emitter<RegisterFormState> emit) {
    emit(
        state.copyWith(
          formKey: _formKey,
          name: RegisterFormBlocModel(
            value: event.email.value,
            error: event.email.value.isValidEmail ? null : "Enter Email"
          )
        )
    );
  }

  FutureOr<void> _passwordChangeEvent(PasswordChangeEvent event, Emitter<RegisterFormState> emit) {
    emit(
        state.copyWith(
          formKey: _formKey,
          name: RegisterFormBlocModel(
            value: event.password.value,
            error: event.password.value.isValidPassword ? null : "Enter Password"
          )
        )
    );
  }

  FutureOr<void> _formSubmitEvent(FormSubmitEvent event, Emitter<RegisterFormState> emit) {
    if(_formKey.currentState!.validate()){
      emit(RegisterFormSuccessState());
    }
  }

  FutureOr<void> _formResetEvent(FormResetEvent event, Emitter<RegisterFormState> emit) {
    _formKey.currentState?.reset();
  }
}
