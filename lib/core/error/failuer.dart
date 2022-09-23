import 'package:equatable/equatable.dart';


abstract class Failuer extends Equatable {
  final String erorrMessage;

  const Failuer(this.erorrMessage);
  List<Object?> get props => [erorrMessage];
}
class ServerFailuer extends Failuer{
  ServerFailuer(super.erorrMessage);

}
class LocalDatabaseFailuer extends Failuer{
  LocalDatabaseFailuer(super.erorrMessage);

}
