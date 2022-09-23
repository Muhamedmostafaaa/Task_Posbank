import 'package:task_posbank/features/notes/domain/entities/user.dart';

class UserModel extends User {
  UserModel(
      {required super.userName,
      required super.password,
      required super.email,
      required super.intersetId,
       required super.id,
      super.image});
  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
      userName: json['username'],
      password: json['password'],
      email: json['email'],
      intersetId: json['intrestId'],
      id: json['id'],
      image: json['imageAsBase64']);
  Map<String, dynamic> toJson() {
    return {
      'Username': userName,
      'Password': password,
      'Email': email,
      'ImageAsBase64': image,
      'IntrestId': intersetId
    };
  }
}
