import 'package:equatable/equatable.dart';

import '../entities/entities.dart';

class MyUser extends Equatable {
  final String userId;
  final String email; 
  final String phoneNumb; 
  final String fname;
  final String lname;
  final String birthday;

  const MyUser({
    required this.userId,
    required this.email,
    required this.phoneNumb,
    required this.fname,
    required this.lname,
    required this.birthday,
  });

  static const empty = MyUser(
    userId: '',
    email: '',
    phoneNumb: '',
    fname: '',
    lname: '',
    birthday: '',
  );

  MyUser copyWith({
    String? userId,
    String? email,
    String? phoneNumb,
    String? fname,
    String? lname,
    String? birthday,
  }) {
    return MyUser(
      userId: userId ?? this.userId,
      email: email ?? this.email,
      phoneNumb: email ?? this.phoneNumb,
      fname: fname ?? this.fname,
      lname: lname ?? this.lname,
      birthday: birthday ?? this.birthday,
    );
  }

  MyUserEntity toEntity() {
    return MyUserEntity(
      userId: userId,
      email: email,
      phoneNumb: phoneNumb,
      fname: fname,
      lname: lname,
      birthday: birthday,
    );
  }

  static MyUser fromEntity(MyUserEntity entity) {
    return MyUser(
      userId: entity.userId,
      email: entity.email,
      phoneNumb: entity.phoneNumb,
      fname: entity.fname,
      lname: entity.lname,
      birthday: entity.birthday,
    );
  }

  @override
  List<Object?> get props => throw UnimplementedError();
}
