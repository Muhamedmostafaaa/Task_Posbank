import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:sqflite/sqflite.dart';
import 'package:task_posbank/core/usecases/base_usecase.dart';
import 'package:task_posbank/features/notes/data/models/notes_model.dart';
import 'package:task_posbank/features/notes/data/models/user_model.dart';
import 'package:task_posbank/features/notes/domain/entities/intrest.dart';
import 'package:task_posbank/features/notes/domain/entities/notes.dart';
import 'package:task_posbank/features/notes/domain/entities/user.dart';
import 'package:task_posbank/features/notes/domain/use_cases/get_all_intrests_use_case.dart';
import 'package:task_posbank/features/notes/domain/use_cases/get_all_notes_use_case.dart';
import 'package:task_posbank/features/notes/domain/use_cases/get_all_users_use_case.dart';
import 'package:task_posbank/features/notes/domain/use_cases/get_note_use_case.dart';
import 'package:task_posbank/features/notes/domain/use_cases/insert_user_use_case.dart';
import 'package:task_posbank/features/notes/domain/use_cases/update_note_use_case.dart';

part 'notes_state.dart';

class NotesCubit extends Cubit<NotesState> {
  final GetAllNotesUseCase getAllNotesUseCase;
  final GetNoteUseCase getNoteUseCase;
  final UpdateNoteUseCase updateNoteUseCase;
  final GetAllUsersUseCase getAllUsersUseCase;
  final GetAllIntrestsUseCase getAllIntrestsUseCase;
  final InsertUserUseCase insertUserUseCase;
  NotesCubit(
      this.getAllUsersUseCase,
      this.getAllNotesUseCase,
      this.getNoteUseCase,
      this.updateNoteUseCase,
      this.getAllIntrestsUseCase,
      this.insertUserUseCase)
      : super(NotesInitial());
  List<Notes> notes = [];
  late int noteId;
  String errorMessage = '';
  Notes? singleNote;
  List<User> users = [];
  List<Intrest> intrests = [];
  Database? database;
  dynamic updateResponse;
  dynamic insertResponse;
  void getAllNotes() async {
    emit(GetAllNotesLoadState());
    final result = await getAllNotesUseCase(const NoParameter());
    result.fold((l) {
      errorMessage = l.erorrMessage;
      emit(GetAllNotesErrorState());
    }, (r) {
      notes = r;
      emit(GetAllNotesSuccessState());
    });
  }

  void getNote(int id) async {
    emit(GetNoteLoadState());
    final result = await getNoteUseCase.call(id);
    result.fold((l) {
      errorMessage = l.erorrMessage;
      emit(GetNoteErrorState());
    }, (r) {
      singleNote = r;

      emit(GetNoteSuccessState());
    });
  }

  void updateNote(NotesModel notesModel) async {
    emit(UpdateNoteLoadState());
    final result = await updateNoteUseCase.call(notesModel);
    result.fold((l) {
      errorMessage = l.erorrMessage;
      emit(UpdateNoteErrorState());
    }, (r) {
      updateResponse = r;

      emit(UpdateNoteSuccessState());
    });
  }

  void getAllUsers() async {
    emit(GetAllUsersLoadState());
    final result = await getAllUsersUseCase(const NoParameter());
    result.fold((l) {
      errorMessage = l.erorrMessage;
      emit(GetAllUsersErrorState());
    }, (r) {
      users = r;
      emit(GetAllUsersSuccessState());
    });
  }

  void getAllIntrests() async {
    emit(GetAllIntrestsLoadState());
    final result = await getAllIntrestsUseCase(const NoParameter());
    result.fold((l) {
      errorMessage = l.erorrMessage;
      emit(GetAllIntrestsErrorState());
    }, (r) {
      intrests = r;

      emit(GetAllIntrestsSuccessState());
    });
  }

  void insertUser(UserModel userModel) async {
    emit(InsertUserLoadState());
    final result = await insertUserUseCase.call(userModel);
    result.fold((l) {
      errorMessage = l.erorrMessage;
      emit(InsertUserErrorState());
    }, (r) {
      insertResponse = r;

      emit(InsertUserSuccessState());
    });
  }

  /// Local DaTaBase
  void createdatabase() async {
    database = await openDatabase('users.db', version: 1,
        onCreate: (Database db, int version) async {
      // When creating the db, create the table

      await db
          .execute(
              'CREATE TABLE users (id INTEGER PRIMARY KEY, username TEXT, password TEXT, email TEXT, intrest Text)')
          .then((value) => print('data created'))
          .catchError((error) {
        print(error.toString());
      });
    }, onOpen: (database) {
      print('database opened');
      getdata(database);
    });
  }

  void inserttodatabase(UserModel userModel) {
    database!.transaction((txn) async {
      txn
          .rawInsert(
              'INSERT INTO tasks(username, password, email, intrest) VALUES("${userModel.userName}","${userModel.password}","${userModel.email}","${userModel.intersetId}")')
          .then((value) {
        print('data inserted succesflly $value');
        getdata(database!);
      }).catchError((error) {
        print('erroe when instering ${error.toString()}');
      });
    });
  }

  void getdata(Database database) {
    database.rawQuery('SELECT * FROM tasks').then((value) {});
    ;
  }

  void updatefromdatabase(String id, String username) {
    database?.rawUpdate('UPDATE tasks SET username = ? WHERE id = ?',
        ["$username", id]).then((value) {
      getdata(database!);
    });
  }

  void deletefromdatabase(int id) {
    database?.rawDelete('DELETE FROM tasks WHERE id = ?', [id]).then((value) {
      getdata(database!);
    });
  }
}
