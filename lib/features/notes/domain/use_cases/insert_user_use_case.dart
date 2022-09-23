import 'package:dartz/dartz.dart';
import 'package:task_posbank/core/error/failuer.dart';
import 'package:task_posbank/core/usecases/base_usecase.dart';
import 'package:task_posbank/features/notes/data/models/user_model.dart';
import 'package:task_posbank/features/notes/domain/repository/base_notes_repository.dart';

class InsertUserUseCase extends BaseUseCase<dynamic,UserModel>{
  final BaseNotesRepository baseNotesRepository;

  InsertUserUseCase(this.baseNotesRepository);

  @override
  Future<Either<Failuer, dynamic>> call(UserModel parameter) async{
    return await baseNotesRepository.inserUser(parameter);
  }

}