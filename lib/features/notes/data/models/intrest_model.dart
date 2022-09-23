import 'package:task_posbank/features/notes/domain/entities/intrest.dart';

class IntrestModel extends Intrest{
  IntrestModel({required super.intrestText, required super.id});
  factory IntrestModel.fromJson(Map<String,dynamic>json)=>IntrestModel
    (intrestText: json['intrestText'], id: json['id']);





}