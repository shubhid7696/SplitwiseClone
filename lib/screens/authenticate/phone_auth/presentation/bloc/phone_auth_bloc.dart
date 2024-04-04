import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';

part 'phone_auth_event.dart';

part 'phone_auth_state.dart';

class PhoneAuthBloc extends Bloc<PhoneAuthEvent, PhoneAuthState> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  String? verificationId;

  PhoneAuthBloc() : super(PhoneAuthInitial()) {
    on<PhoneAuthEvent>((event, emit) {
      // TODO: implement event handler
    });
    on<SendOtp>(_sendOtp);
    on<VerifyOtp>(_verifyOtp);
    on<SignInPhone>(_signInPhone);
  }

  FutureOr<void> _sendOtp(SendOtp event, Emitter<PhoneAuthState> emit) async {
    await _auth.verifyPhoneNumber(
        phoneNumber: event.phoneNumber,
        verificationCompleted: (phoneAuthCreds) {
          emit(PhoneAuthVerified());
        },
        verificationFailed: (firebaseAuthException) {
          emit(PhoneAuthLoggedError(
              error: firebaseAuthException.message.toString()));
        },
        codeSent: (verificationId, forceResendingToken) {
          this.verificationId = verificationId;
          emit(PhoneAuthCodeSent());
        },
        codeAutoRetrievalTimeout: (verificationId) {
          emit(const PhoneAuthLoggedError(error: "Timed Out"));
        });
  }

  FutureOr<void> _verifyOtp(
      VerifyOtp event, Emitter<PhoneAuthState> emit) async {
    PhoneAuthCredential _phoneAuthCredential = PhoneAuthProvider.credential(
        verificationId: verificationId.toString(), smsCode: event.otp);
    try {
      UserCredential credential =
          await _auth.signInWithCredential(_phoneAuthCredential);
      if (credential.user != null) {
        emit(PhoneAuthLoggedIn());
      }
    } on FirebaseAuthException catch (ex) {
      emit(PhoneAuthLoggedError(error: ex.message.toString()));
    }
  }

  FutureOr<void> _signInPhone(
      SignInPhone event, Emitter<PhoneAuthState> emit) async {}
}
