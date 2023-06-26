part of 'materi_bloc.dart';

@immutable
abstract class MateriState {}

class MateriInitial extends MateriState {}

class MateriLoading extends MateriState{}

class MateriGetMateriByRoomIdState extends MateriState{
  final GetMateriByRoomIdResponseEntity getMateriByRoomIdResponseEntity;
  MateriGetMateriByRoomIdState(this.getMateriByRoomIdResponseEntity);

  @override
  List<Object?> get props => [getMateriByRoomIdResponseEntity];
}

class MateriGetChapterByMateriIdState extends MateriState{
  final GetChapterByMateriIdEntity getChapterByMateriIdEntity;
  MateriGetChapterByMateriIdState(this.getChapterByMateriIdEntity);

  @override
  List<Object?> get props => [getChapterByMateriIdEntity];
}

class MateriFailedState extends MateriState{
  final String message;

  MateriFailedState(this.message);

  @override
  List<Object?> get props => [message];
}

class MateriChangesChapterState extends MateriState{
  final Chapter chapter;
  final int currentIndex;

  MateriChangesChapterState(this.chapter, this.currentIndex);
}

class MateriPrevChapterButton extends MateriState{
  final bool prevButton;

  MateriPrevChapterButton(this.prevButton);
}

class MateriNextChapterButton extends MateriState{
  final bool nextButton;

  MateriNextChapterButton(this.nextButton);
}