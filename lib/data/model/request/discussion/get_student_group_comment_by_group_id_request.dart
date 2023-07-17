class GetStudentGroupCommentByGroupIdRequest {
  GetStudentGroupCommentByGroupIdRequest({
    required this.group_id,
  });
  late final int group_id;

  Map<String, dynamic> toMap() {
    return {
      'group_id': group_id,
    };
  }
}