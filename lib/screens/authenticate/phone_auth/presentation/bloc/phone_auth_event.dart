part of 'phone_auth_bloc.dart';

sealed class PhoneAuthEvent extends Equatable {
  const PhoneAuthEvent();

  @override
  List<Object?> get props => throw UnimplementedError();
}

class SendOtp extends PhoneAuthEvent {
  final String phoneNumber;
  const SendOtp(this.phoneNumber);
}
class VerifyOtp extends PhoneAuthEvent {
  final String otp;
  const VerifyOtp(this.otp);
}
class SignInPhone extends PhoneAuthEvent {}