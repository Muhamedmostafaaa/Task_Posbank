import 'package:equatable/equatable.dart';

class Intrest extends Equatable {
  final String intrestText;
  final String id;

  const Intrest({required this.intrestText, required this.id});

  @override
  List<Object> get props => [intrestText, id];
}