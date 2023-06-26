import 'package:codelytic/data/model/response/materi/get_chapter_by_materi_id.dart';

class ShowIndexArgument {
   int? index;

   ShowIndexArgument({ this.index});

  Map<String, dynamic> toMap() {
    return {'index': index};
  }
}