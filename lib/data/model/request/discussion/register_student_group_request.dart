class RegisterStudentGroupRequest{
  RegisterStudentGroupRequest({
    required this.room_id,
    required this.group_id,
  });
  late final int room_id;
  late final int group_id;

  Map<String, dynamic> toMap() {
    return {
      'room_id': room_id,
      'group_id': group_id,
    };
  }
}