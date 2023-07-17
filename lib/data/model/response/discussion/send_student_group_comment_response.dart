import 'package:codelytic/domain/entities/discussion/send_student_group_comment_entity.dart';
import 'package:equatable/equatable.dart';

class SendStudentGroupCommentResponse extends Equatable{
  SendStudentGroupCommentResponse({
    this.group_id,
  });
  int? group_id;

  SendStudentGroupCommentResponse.fromJson(Map<String, dynamic> json){
    group_id = json['group_id'];
  }

  SendStudentGroupCommentEntity toEntity() => SendStudentGroupCommentEntity(group_id: group_id);

  @override
  List<Object?> get props => [group_id];
}