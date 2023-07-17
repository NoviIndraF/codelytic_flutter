import 'package:codelytic/domain/entities/discussion/register_student_group_entity.dart';
import 'package:equatable/equatable.dart';

class SendStudentGroupCommentEntity extends Equatable{
  SendStudentGroupCommentEntity({
    this.group_id,
  });
  int? group_id;

  SendStudentGroupCommentEntity.fromJson(Map<String, dynamic> json){
    group_id = json['group_id'];
  }

  @override
  List<Object?> get props => [group_id];
}