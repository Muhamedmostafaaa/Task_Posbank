import 'package:get_it/get_it.dart';
import 'package:task_posbank/core/network/dio_helper.dart';
import 'package:task_posbank/features/notes/data/data_source/base_notes_remote_data_source.dart';
import 'package:task_posbank/features/notes/data/repository/notes_repository.dart';
import 'package:task_posbank/features/notes/domain/repository/base_notes_repository.dart';
import 'package:task_posbank/features/notes/domain/use_cases/get_all_intrests_use_case.dart';
import 'package:task_posbank/features/notes/domain/use_cases/get_all_notes_use_case.dart';
import 'package:task_posbank/features/notes/domain/use_cases/get_all_users_use_case.dart';
import 'package:task_posbank/features/notes/domain/use_cases/get_note_use_case.dart';
import 'package:task_posbank/features/notes/domain/use_cases/insert_user_use_case.dart';
import 'package:task_posbank/features/notes/domain/use_cases/update_note_use_case.dart';
import 'package:task_posbank/features/notes/presentation/controller/notes_cubit.dart';

final sl = GetIt.instance;

class ServiceLocator {
  void init() {
    ///BLOC
    sl.registerFactory(() => NotesCubit(sl(),sl(),sl(),sl(),sl(),sl()));

    ///USE CASE

    sl.registerLazySingleton(() => GetAllNotesUseCase(sl()));
    sl.registerLazySingleton(() => GetNoteUseCase(sl()));
    sl.registerLazySingleton(() => UpdateNoteUseCase(sl()));
    sl.registerLazySingleton(() => GetAllUsersUseCase(sl()));
    sl.registerLazySingleton(() => GetAllIntrestsUseCase(sl()));
    sl.registerLazySingleton(() => InsertUserUseCase(sl()));

    ///REPOSITORY
    sl.registerLazySingleton<BaseNotesRepository>(() => NotesRepository(sl()));

    /// DATA SOURCE
    sl.registerLazySingleton<BaseNotesRemoteDataSource>(
        () => NotesRemoteDataSource(sl()));

    /// Dio
    sl.registerLazySingleton<BaseDioHelper>(() => DioHelper());
  }
}
