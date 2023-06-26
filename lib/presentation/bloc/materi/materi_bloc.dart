
import 'package:bloc/bloc.dart';
import 'package:codelytic/data/model/request/materi/get_chapter_by_materi_id_request.dart';
import 'package:codelytic/data/model/request/materi/get_materi_by_room_id_request.dart';
import 'package:codelytic/data/model/response/materi/get_chapter_by_materi_id.dart';
import 'package:codelytic/domain/entities/materi/get_chapter_by_materi_id_entity.dart';
import 'package:codelytic/domain/entities/materi/get_materi_by_room_code_entity.dart';
import 'package:codelytic/domain/usecase/materi/materi_usecase.dart';
import 'package:meta/meta.dart';

part 'materi_event.dart';
part 'materi_state.dart';

class MateriBloc extends Bloc<MateriEvent, MateriState> {
  final MateriUsecase materiUseCase;
  List<Chapter>? chapterList = [];
  MateriBloc(this.materiUseCase) : super(MateriInitial()) {
    on<MateriEvent>((event, emit) {
      // TODO: implement event handler
    });

    on<MateriGetMateriByRoomIdEvent>((event, emit) async {
      emit(MateriLoading());
      print("MateriGetMateriByRoomCodeEvent :");

      final getMateri =
          await materiUseCase.getMateriByRoomId(event.token, event.request);
      getMateri.fold(
              (failure) => emit(MateriFailedState(failure.toString())),
          (data) {
                if(data.materi?.length == 0){
                  GetMateriByRoomIdResponseEntity();
                }
          emit(MateriGetMateriByRoomIdState(data)
        );
      });
    });

    on<MateriChapterByMateriIdEvent>((event, emit) async {
      emit(MateriLoading());
      print("MateriChapterByMateriIdEvent :");

      final getMateri =
      await materiUseCase.getChapterByMateriId(event.token, event.request);
      getMateri.fold(
              (failure) => emit(MateriFailedState(failure.toString())),
              (data) {
                if(data.chapter!.isNotEmpty){
                   data.chapter?.sort((a, b) => a.index!.compareTo(b.index!));
                   chapterList = data.chapter;
                }
            emit(MateriGetChapterByMateriIdState(data));
          });
    });

    on<MateriChangesChapterEvent>((event, emit) async {
      emit(MateriLoading());
      print("MateriChangesChapterEvent :");
      Chapter chapter = Chapter();
      int index=0;
      if(event.isNext){
        index = event.index+1;
          chapter = chapterList![index];
          if(index+1 == chapterList!.length){
            emit(MateriNextChapterButton(false));
            emit(MateriPrevChapterButton(true));
          } else {
            emit(MateriNextChapterButton(true));
            emit(MateriPrevChapterButton(true));
          }
      } else if(event.isPrev){
        index = event.index-1;
        chapter = chapterList![index];
        if(index == 0){
          emit(MateriPrevChapterButton(false));
          emit(MateriNextChapterButton(true));
        } else {
          emit(MateriPrevChapterButton(true));
          emit(MateriNextChapterButton(true));
        }
      } else if(!event.isPrev && !event.isNext){
        index = event.index;
        chapter = chapterList![index];
        if(index+1 == chapterList!.length){
          emit(MateriPrevChapterButton(true));
          emit(MateriNextChapterButton(false));
        } else if(index == 0){
          emit(MateriPrevChapterButton(false));
          emit(MateriNextChapterButton(true));
        } else {
          emit(MateriNextChapterButton(true));
          emit(MateriPrevChapterButton(true));
        }
      }
      emit(MateriChangesChapterState(chapter, index));
    });
  }
}


