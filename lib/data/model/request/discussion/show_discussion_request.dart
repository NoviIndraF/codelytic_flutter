import 'package:codelytic/data/model/response/discussion/group.dart';

class ShowDiscussionArgument {
  Group? group;

  ShowDiscussionArgument({this.group});

  Map<String, dynamic> toMap() {
    return {'group': group};
  }
}