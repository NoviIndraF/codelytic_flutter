class UpdateHideStudentGroupCommentRequest{
  UpdateHideStudentGroupCommentRequest({
    required this.group_id,
    required this.comment_id,
  });
  late final int group_id;
  late final int comment_id;

  Map<String, dynamic> toMap() {
    return {
      'group_id': group_id,
      'comment_id': comment_id,
    };
  }
}