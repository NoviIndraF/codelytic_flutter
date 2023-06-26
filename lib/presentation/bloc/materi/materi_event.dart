part of 'materi_bloc.dart';

@immutable
abstract class MateriEvent {}

class MateriGetMateriByRoomIdEvent extends MateriEvent{
  final GetMateriByRoomIdRequest request;
  final String token;
  MateriGetMateriByRoomIdEvent(this.token, this.request);

  @override
  List<Object?> get props => [token, request];
}

class MateriChapterByMateriIdEvent extends MateriEvent{
  final GetChapterByMateriIdRequest request;
  final String token;
  MateriChapterByMateriIdEvent(this.token, this.request);

  @override
  List<Object?> get props => [token, request];
}

class MateriChangesChapterEvent extends MateriEvent{
  final int index;
  final bool isNext;
  final bool isPrev;
  MateriChangesChapterEvent(this.index, this.isNext, this.isPrev);

  @override
  List<Object?> get props => [index];
}