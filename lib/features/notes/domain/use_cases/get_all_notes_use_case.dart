import 'package:dartz/dartz.dart';
import 'package:task_posbank/core/error/failuer.dart';
import 'package:task_posbank/core/usecases/base_usecase.dart';
import 'package:task_posbank/features/notes/domain/entities/notes.dart';
import 'package:task_posbank/features/notes/domain/repository/base_notes_repository.dart';

class GetAllNotesUseCase extends BaseUseCase<List<Notes>,NoParameter>{
  final BaseNotesRepository baseNotesRepository;

  GetAllNotesUseCase(this.baseNotesRepository);

  @override
  Future<Either<Failuer, List<Notes>>> call(NoParameter parameter)async {
    return await baseNotesRepository.getAllNotes();
  }

}