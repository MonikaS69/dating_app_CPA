import 'package:firebase_auth/firebase_auth.dart';
import 'models/user.dart';

abstract class UserRepository {
  Stream<User?> get user;

  Future<MyUser> signUp(MyUser myUser, String password);

  Future<void> setUserData(MyUser user);

  Future<void> signInEmail(String email, String password);

  Future<void> signInPhoneNumb(String phoneNumb, {String? verificationId});
}
