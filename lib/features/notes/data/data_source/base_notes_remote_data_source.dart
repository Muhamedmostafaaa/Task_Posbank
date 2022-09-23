import 'dart:convert';

import 'package:task_posbank/core/error/excptions.dart';
import 'package:task_posbank/core/network/api_constants.dart';
import 'package:task_posbank/core/network/dio_helper.dart';
import 'package:task_posbank/features/notes/data/models/intrest_model.dart';
import 'package:task_posbank/features/notes/data/models/notes_model.dart';
import 'package:task_posbank/features/notes/data/models/user_model.dart';
import 'package:task_posbank/features/notes/domain/entities/notes.dart';

abstract class BaseNotesRemoteDataSource {
  Future<List<NotesModel>> getAllNotes();
  Future<NotesModel> getNote(int id);
  Future<List<UserModel>>getAllUsers();
  Future<List<IntrestModel>>getAllIntrests();
  Future<dynamic> updateNote(NotesModel notesModel);
  Future<dynamic> insertUser(UserModel userModel);
}

class NotesRemoteDataSource extends BaseNotesRemoteDataSource {
  final BaseDioHelper baseDioHelper;

  NotesRemoteDataSource(this.baseDioHelper);

  @override
  Future<List<NotesModel>> getAllNotes() async {
    final response = await baseDioHelper.getData(
      path: ApiConstants.getAllNotes,
    );
    if (response.statusCode == 200) {
      return List<NotesModel>.from(
          (response.data as List).map((e) => NotesModel.fromJson(e)));
    } else {
      throw RemoteServerExcption(erorrMessage: 'error in server');
    }
  }

  @override
  Future<NotesModel> getNote(int id) async {
    final response =
        await baseDioHelper.getData(path: ApiConstants.getNote(id));
    if (response.statusCode == 200) {
      return NotesModel.fromJson(response.data);
    } else {
      throw RemoteServerExcption(erorrMessage: 'error in server');
    }
  }

  @override
  Future updateNote(NotesModel notesModel) async {
    final response = await baseDioHelper.postData(
        path: ApiConstants.updateNote, data: jsonEncode(notesModel.toJson()));
   if(response.statusCode==200){
     return response;
   } else{
     throw RemoteServerExcption(erorrMessage: 'server error');
   }
  }

  @override
  Future<List<UserModel>> getAllUsers()async {
    final response= await baseDioHelper.getData(path: ApiConstants.getAllUsers);
    if(response.statusCode==200){
      return List<UserModel>.from((response.data as List).map((e) => UserModel.fromJson(e)));
    }else{
      throw RemoteServerExcption(erorrMessage: 'server error');
    }
  }

  @override
  Future<List<IntrestModel>> getAllIntrests()async {
    final response= await baseDioHelper.getData(path: ApiConstants.getAllIntrests);
    if(response.statusCode==200){
      return List<IntrestModel>.from((response.data as List).map((e) => IntrestModel.fromJson(e)));
    }else{
      throw RemoteServerExcption(erorrMessage: 'server error');
    }
  }

  @override
  Future insertUser(UserModel userModel) async {
    final response = await baseDioHelper.postData(
        path: ApiConstants.inserUser, data: jsonEncode(userModel.toJson()));
    if(response.statusCode==200){
      return response;
    } else{
      throw RemoteServerExcption(erorrMessage: 'server error');
    }
  }
}
