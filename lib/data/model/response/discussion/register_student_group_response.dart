import 'package:codelytic/domain/entities/discussion/register_student_group_entity.dart';
import 'package:equatable/equatable.dart';

class RegisterStudentGroupResponse extends Equatable{
  RegisterStudentGroupResponse({
    this.group_id,
  });
  int? group_id;

  RegisterStudentGroupResponse.fromJson(Map<String, dynamic> json){
    group_id = json['group_id'];
  }

  RegisterStudentGroupEntity toEntity() => RegisterStudentGroupEntity(group_id: group_id);

  @override
  List<Object?> get props => [group_id];
}