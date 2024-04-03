class RegisterFormBlocModel {
  final String value;
  final String? error;

  const RegisterFormBlocModel({this.value = '', this.error});

  RegisterFormBlocModel copyWith({
    final String? value,
    final String? error,
  }){
    return RegisterFormBlocModel(
      value: value ?? this.value,
      error: error ?? this.error
    );
  }
}