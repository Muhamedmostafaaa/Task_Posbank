import 'package:dartz/dartz.dart';
import 'package:task_posbank/core/error/failuer.dart';
import 'package:task_posbank/core/usecases/base_usecase.dart';
import 'package:task_posbank/features/notes/domain/entities/user.dart';
import 'package:task_posbank/features/notes/domain/repository/base_notes_repository.dart';

class GetAllUsersUseCase extends BaseUseCase<List<User>,NoParameter>{
  final BaseNotesRepository baseNotesRepository;

  GetAllUsersUseCase(this.baseNotesRepository);

  @override
  Future<Either<Failuer, List<User>>> call(NoParameter parameter)async {
    return await baseNotesRepository.getAllUsers();
  }

}