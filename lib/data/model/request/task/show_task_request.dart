import 'package:codelytic/data/model/response/materi/get_chapter_by_materi_id.dart';
import 'package:codelytic/data/model/response/task/get_task_by_room_code_response.dart';

import '../../response/task/task.dart';

class ShowTaskArgument {
  int? index;
  Task? task;

  ShowTaskArgument({ this.index, this.task});

  Map<String, dynamic> toMap() {
    return {'index': index, 'task': task};
  }
}