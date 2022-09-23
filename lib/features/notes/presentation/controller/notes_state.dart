part of 'notes_cubit.dart';

@immutable
abstract class NotesState {}

class NotesInitial extends NotesState {}
class GetAllNotesLoadState extends NotesState{}
class GetAllNotesSuccessState extends NotesState{}
class GetAllNotesErrorState extends NotesState{}

class GetNoteLoadState extends NotesState{}
class GetNoteSuccessState extends NotesState{}
class GetNoteErrorState extends NotesState{}

class GetAllUsersLoadState extends NotesState{}
class GetAllUsersSuccessState extends NotesState{}
class GetAllUsersErrorState extends NotesState{}

class InsertUserLoadState extends NotesState{}
class InsertUserSuccessState extends NotesState{}
class InsertUserErrorState extends NotesState{}

class UpdateNoteLoadState extends NotesState{}
class UpdateNoteSuccessState extends NotesState{}
class UpdateNoteErrorState extends NotesState{}

class GetAllIntrestsLoadState extends NotesState{}
class GetAllIntrestsSuccessState extends NotesState{}
class GetAllIntrestsErrorState extends NotesState{}



