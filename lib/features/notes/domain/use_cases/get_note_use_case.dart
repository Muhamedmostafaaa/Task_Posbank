import 'package:dartz/dartz.dart';
import 'package:task_posbank/core/error/failuer.dart';
import 'package:task_posbank/core/usecases/base_usecase.dart';
import 'package:task_posbank/features/notes/domain/repository/base_notes_repository.dart';

import '../entities/notes.dart';

class GetNoteUseCase extends BaseUseCase<Notes,int>{
  final BaseNotesRepository baseNotesRepository;

  GetNoteUseCase(this.baseNotesRepository);

  @override
  Future<Either<Failuer, Notes>> call(int id)async {
   return await baseNotesRepository.getNote(id);
  }

}