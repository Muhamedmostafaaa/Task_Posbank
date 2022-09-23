import 'package:task_posbank/features/notes/domain/entities/notes.dart';

class NotesModel extends Notes {
  NotesModel(
      { super.text,
      required super.placeDateTime,
      required super.id,
      super.userId});
  factory NotesModel.fromJson(Map<String, dynamic> json) => NotesModel(
      text: json['text']??'',
      placeDateTime: json['placeDateTime'],
      id: json['id'],
      userId: json['userId'] ?? '0');
  Map<String, dynamic> toJson() {
    return {
      'Id': id,
      'Text': text,
      'UserId': userId,
      'PlaceDateTime': placeDateTime,
    };
  }
}
