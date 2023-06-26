import 'package:codelytic/data/model/request/materi/get_chapter_by_materi_id_request.dart';
import 'package:codelytic/data/model/request/materi/get_materi_by_room_id_request.dart';
import 'package:codelytic/data/model/request/task/submit_task_request.dart';
import 'package:codelytic/data/model/response/materi/get_chapter_by_materi_id.dart';
import 'package:codelytic/data/model/response/materi/get_materi_by_room_id_response.dart';
import 'package:codelytic/data/model/response/task/submit_task_response.dart';

abstract class MateriRemoteDataSource{
  Future<GetChapterByMateriIdResponse> getChapterByMateriId(String token, GetChapterByMateriIdRequest request);
  Future<GetMateriByRoomIdResponse> getMateriByRoomId(String token, GetMateriByRoomIdRequest request);
}