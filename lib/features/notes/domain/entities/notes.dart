import 'package:equatable/equatable.dart';

class Notes extends Equatable {
  final String? text;
  final String placeDateTime;
  final String id;
  final String? userId;

  const Notes({ this.text,
    required this.placeDateTime,
    required this.id,
    this.userId});

  @override
  List<Object?> get props => [text, placeDateTime, id, userId];
}
