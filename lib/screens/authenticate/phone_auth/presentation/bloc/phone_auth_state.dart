part of 'phone_auth_bloc.dart';

sealed class PhoneAuthState extends Equatable {
  const PhoneAuthState();

  @override
  List<Object> get props => [];
}

class PhoneAuthInitial extends PhoneAuthState {}
class PhoneAuthCodeSent extends PhoneAuthState {}
class PhoneAuthVerified extends PhoneAuthState {}
class PhoneAuthLoggedIn extends PhoneAuthState {}
class PhoneAuthLoggedOut extends PhoneAuthState {}
class PhoneAuthLoggedError extends PhoneAuthState {
  final String error;
  const PhoneAuthLoggedError({required this.error});
}


