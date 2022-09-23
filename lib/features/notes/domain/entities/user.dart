import 'package:equatable/equatable.dart';

class User extends Equatable {
  final String userName;
  final String password;
  final String email;
  final String? image;
  final String intersetId;
  final String id;

  const User({required this.userName,
    required this.password,
    required this.email,
    this.image,
    required this.intersetId,
    required this.id});

  @override
  List<Object?> get props =>
      [userName, password, email, image, intersetId, id,];
}