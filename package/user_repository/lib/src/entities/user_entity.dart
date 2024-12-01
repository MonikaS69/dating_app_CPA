import 'package:equatable/equatable.dart';

class MyUserEntity extends Equatable {
  final String userId;
  final String email;
  final String phoneNumb;
  final String fname;
  final String lname;
  final String birthday;

  const MyUserEntity({
    required this.userId,
    required this.email,
    required this.phoneNumb,
    required this.fname,
    required this.lname,
    required this.birthday,
  });

  Map<String, Object?> toDocument() {
    return {
      'userId': userId,
      'email': email,
      'phoneNumb': phoneNumb,
      'fname': fname,
      'lname': lname,
      'birthday': birthday,
    };
  }

  static MyUserEntity fromDoctument(Map<String, dynamic> doc) {
    return MyUserEntity(
      userId: doc['userId'],
      email: doc['email'],
      phoneNumb: doc['phoneNumb'],
      fname: doc['fname'],
      lname: doc['lname'],
      birthday: doc['birthday'],
    );
  }

  @override
  List<Object?> get props => [userId, fname, lname, email, birthday];
}
