part of 'register_form_bloc.dart';

sealed class RegisterFormEvent extends Equatable {
  const RegisterFormEvent();

  @override
  List<Object?> get props => [];
}

class InitEvent extends RegisterFormEvent{}

class FormResetEvent extends RegisterFormEvent{}

class FormSubmitEvent extends RegisterFormEvent{}

class NameChangeEvent extends RegisterFormEvent{
  final RegisterFormBlocModel name;
  const NameChangeEvent({required this.name});

  @override
  List<Object?> get props => [name];
}
class EmailChangeEvent extends RegisterFormEvent{
  final RegisterFormBlocModel email;
  const EmailChangeEvent({required this.email});

  @override
  List<Object?> get props => [email];
}
class PasswordChangeEvent extends RegisterFormEvent{
  final RegisterFormBlocModel password;
  const PasswordChangeEvent({required this.password});

  @override
  List<Object?> get props => [password];
}