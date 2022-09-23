

class RemoteServerExcption implements Exception{
  final String erorrMessage;

  RemoteServerExcption({required this.erorrMessage});
}
class LocalDataBaseException implements Exception{
  final String erorrMessage;

  LocalDataBaseException({required this.erorrMessage});
}
