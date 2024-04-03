part of 'register_form_bloc.dart';

class RegisterFormState extends Equatable {
  final RegisterFormBlocModel name;
  final RegisterFormBlocModel email;
  final RegisterFormBlocModel password;
  final GlobalKey<FormState>? formKey;

  const RegisterFormState({
    this.name = const RegisterFormBlocModel(error: 'Enter name'),
    this.email = const RegisterFormBlocModel(error: 'Enter email'),
    this.password = const RegisterFormBlocModel(error: 'Enter password'),
    this.formKey,
  });

  RegisterFormState copyWith({
    RegisterFormBlocModel? name,
    RegisterFormBlocModel? email,
    RegisterFormBlocModel? password,
    GlobalKey<FormState>? formKey,
  }) {
    return RegisterFormState(
      name: name ?? this.name,
      email: email ?? this.email,
      password: password ?? this.password,
      formKey: formKey,
    );
  }

  @override
  List<Object?> get props => [name, email, password, formKey];
}

final class RegisterFormInitial extends RegisterFormState {}

final class RegisterFormSuccessState extends RegisterFormState {}

final class RegisterFormClearState extends RegisterFormState {}


