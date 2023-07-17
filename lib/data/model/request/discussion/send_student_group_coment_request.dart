class SendStudentGroupCommentRequest{
  SendStudentGroupCommentRequest({
    required this.group_id,
    required this.message,
  });
  late final int group_id;
  late final String message;

  Map<String, dynamic> toMap() {
    return {
      'group_id': group_id,
      'message': message,
    };
  }
}