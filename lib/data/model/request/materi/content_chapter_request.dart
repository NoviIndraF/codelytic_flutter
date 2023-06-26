import 'package:codelytic/data/model/response/materi/get_chapter_by_materi_id.dart';

class ContentChapterRequest {
  final String content;

  ContentChapterRequest({required this.content});

  Map<String, String> toMap() {
    return {'content': content};
  }
}