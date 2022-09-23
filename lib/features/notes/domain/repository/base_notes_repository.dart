 import 'package:dartz/dartz.dart';
import 'package:task_posbank/core/error/failuer.dart';
import 'package:task_posbank/features/notes/data/models/notes_model.dart';
import 'package:task_posbank/features/notes/data/models/user_model.dart';
import 'package:task_posbank/features/notes/domain/entities/intrest.dart';
import 'package:task_posbank/features/notes/domain/entities/notes.dart';
import 'package:task_posbank/features/notes/domain/entities/user.dart';

abstract class BaseNotesRepository{
Future<Either<Failuer,List<Notes>>>getAllNotes();
Future<Either<Failuer,Notes>>getNote(int id);
Future<Either<Failuer, dynamic>>updateNote(NotesModel notesModel);
Future<Either<Failuer, dynamic>>inserUser(UserModel userModel);
Future<Either<Failuer,List<User>>>getAllUsers();
Future<Either<Failuer,List<Intrest>>>getAllIntrests();

}