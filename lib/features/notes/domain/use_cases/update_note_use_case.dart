import 'package:dartz/dartz.dart';
import 'package:task_posbank/core/error/failuer.dart';
import 'package:task_posbank/core/usecases/base_usecase.dart';
import 'package:task_posbank/features/notes/data/models/notes_model.dart';
import 'package:task_posbank/features/notes/domain/repository/base_notes_repository.dart';

class UpdateNoteUseCase extends BaseUseCase<dynamic,NotesModel>{
  final BaseNotesRepository baseNotesRepository;

  UpdateNoteUseCase(this.baseNotesRepository);

  @override
  Future<Either<Failuer, dynamic>> call(NotesModel parameter)async {
    return await baseNotesRepository.updateNote(parameter);
  }

}