class GetChapterByMateriIdRequest {
  GetChapterByMateriIdRequest({
    required this.materi_id,
  });

  final String materi_id;

  Map<String, dynamic> toMap() {
    return {
      'materi_id': materi_id,
    };
  }
}