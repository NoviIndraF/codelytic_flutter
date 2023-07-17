import 'package:equatable/equatable.dart';

class RegisterStudentGroupEntity extends Equatable {
  RegisterStudentGroupEntity({
    this.group_id,
  });
  int? group_id;

  RegisterStudentGroupEntity.fromJson(Map<String, dynamic> json) {
    group_id = json['group_id'];
  }
  @override
  List<Object?> get props => [group_id];
}
