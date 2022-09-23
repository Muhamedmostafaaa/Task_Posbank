import 'package:dartz/dartz.dart';
import 'package:task_posbank/core/error/excptions.dart';
import 'package:task_posbank/core/error/failuer.dart';
import 'package:task_posbank/features/notes/data/data_source/base_notes_remote_data_source.dart';
import 'package:task_posbank/features/notes/data/models/notes_model.dart';
import 'package:task_posbank/features/notes/data/models/user_model.dart';
import 'package:task_posbank/features/notes/domain/entities/intrest.dart';
import 'package:task_posbank/features/notes/domain/entities/notes.dart';
import 'package:task_posbank/features/notes/domain/entities/user.dart';
import 'package:task_posbank/features/notes/domain/repository/base_notes_repository.dart';

class NotesRepository extends BaseNotesRepository{
  final BaseNotesRemoteDataSource baseNotesRemoteDataSource;

  NotesRepository(this.baseNotesRemoteDataSource);

  @override
  Future<Either<Failuer, List<Notes>>> getAllNotes()async {
   final result=await baseNotesRemoteDataSource.getAllNotes();
   try{
     return Right(result);
   }on RemoteServerExcption catch(failure){
    return left(ServerFailuer(failure.erorrMessage));
   }
  }

  @override
  Future<Either<Failuer, Notes>> getNote(int id)async {
   final result= await baseNotesRemoteDataSource.getNote(id);
   try{
     return right(result);
   }on RemoteServerExcption catch(failure){
     return left(ServerFailuer(failure.erorrMessage));
   }
  }

  @override
  Future<Either<Failuer, dynamic>> updateNote(NotesModel notesModel)async {
    final result= await baseNotesRemoteDataSource.updateNote(notesModel);
    try{
      return Right(result);
    }on RemoteServerExcption catch(failuer){
      return left(ServerFailuer(failuer.erorrMessage));
    }
  }

  @override
  Future<Either<Failuer, List<User>>> getAllUsers()async {
    final result= await baseNotesRemoteDataSource.getAllUsers();
    try{
      return Right(result);
    }on RemoteServerExcption catch(failuer){
      return left(ServerFailuer(failuer.erorrMessage));

    }
  }

  @override
  Future<Either<Failuer, List<Intrest>>> getAllIntrests()async {
    final result= await baseNotesRemoteDataSource.getAllIntrests();
    try{
      return Right(result);
    }on RemoteServerExcption catch(failuer){
      return left(ServerFailuer(failuer.erorrMessage));

    }
  }

  @override
  Future<Either<Failuer, dynamic>> inserUser(UserModel userModel)async {
    final result= await baseNotesRemoteDataSource.insertUser(userModel);
    try{
      return Right(result);
    }on RemoteServerExcption catch(failuer){
      return left(ServerFailuer(failuer.erorrMessage));
    }
  }


}