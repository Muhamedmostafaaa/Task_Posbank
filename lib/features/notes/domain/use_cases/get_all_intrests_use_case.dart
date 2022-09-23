import 'package:dartz/dartz.dart';
import 'package:task_posbank/core/error/failuer.dart';
import 'package:task_posbank/core/usecases/base_usecase.dart';
import 'package:task_posbank/features/notes/domain/entities/intrest.dart';
import 'package:task_posbank/features/notes/domain/repository/base_notes_repository.dart';

class GetAllIntrestsUseCase extends BaseUseCase<List<Intrest>,NoParameter>{
  final BaseNotesRepository baseNotesRepository;

  GetAllIntrestsUseCase(this.baseNotesRepository);

  @override
  Future<Either<Failuer, List<Intrest>>> call(NoParameter parameter)async {
   return await baseNotesRepository.getAllIntrests();
  }


}