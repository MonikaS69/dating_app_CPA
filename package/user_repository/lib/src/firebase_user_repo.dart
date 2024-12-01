import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:user_repository/src/models/user.dart';
import 'package:user_repository/src/user_repo.dart';

class FirebaseUserRepo implements UserRepository {
  final FirebaseAuth _firebaseAuth;
  final userCollection = FirebaseFirestore.instance.collection('users');

  FirebaseUserRepo({
    FirebaseAuth? firebaseAuth,
  }) : _firebaseAuth = firebaseAuth ?? FirebaseAuth.instance;

  @override
  Stream<User?> get user {
    return _firebaseAuth.authStateChanges().map((firebaseUser) {
      return firebaseUser;
    });
  }

  @override
  Future<void> signInEmail(String email, String password) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }

  @override
  Future<void> signInPhoneNumb(String phoneNumb,
      {String? verificationId}) async {
    try {
      await _firebaseAuth.verifyPhoneNumber(
          phoneNumber: phoneNumb,
          verificationCompleted: (PhoneAuthCredential credential) async {
            await _firebaseAuth.signInWithCredential(credential);
            log('Verification completed automatically');
          },
          verificationFailed: (FirebaseAuthException e) {
            log('Verification failed: ${e.message}');
          },
          codeSent: (String verificationId, int? resendTokend) {
            log('Code sent to $phoneNumb');
          },
          codeAutoRetrievalTimeout: (String verificationId) {
            log('Auto retieval timeout for verification ID: $verificationId');
          });
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }

  Future<void> verifyOtp(String verificationId, String otpCode) async {
    try {
      PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: verificationId,
        smsCode: otpCode,
      );

      // Sign in with the provided OTP
      await _firebaseAuth.signInWithCredential(credential);
      log('User signed in successfully');
    } catch (e) {
      log('Error verifying OTP: ${e.toString()}');
      rethrow;
    }
  }

  @override
  Future<MyUser> signUp(MyUser myUser, String password) async {
    try {
      UserCredential user = await _firebaseAuth.createUserWithEmailAndPassword(
        email: myUser.email,
        password: password,
      );
      myUser = myUser.copyWith(userId: user.user!.uid);

      return myUser;
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }

  @override
  Future<void> setUserData(MyUser user) {
    throw UnimplementedError();
  }
}
